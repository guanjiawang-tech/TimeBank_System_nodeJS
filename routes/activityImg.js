const express = require('express');  
const multer = require('multer');  
const fs = require('fs');  
const path = require('path');
const fs1 = require('fs').promises;
  
// 假设这是您的服务器地址  
const access_address = 'http://localhost:3000'; // 根据实际情况修改  
  
// 创建一个路由实例  
const router = express.Router();  
  
// 定义上传目录  
const uploadDir = path.join(__dirname, '../../TimeBank_System_miniprograme/static/activityimages');  
  
// 检查文件夹是否存在，如果不存在则创建  
if (!fs.existsSync(uploadDir)) {  
  fs.mkdirSync(uploadDir, { recursive: true });  
  console.log('创建上传文件夹成功');  
}  
  
// 配置 multer 中间件来处理文件上传  
const storage = multer.diskStorage({  
  destination: function (req, file, cb) {  
    cb(null, uploadDir);  
  },  
  filename: function (req, file, cb) {
    const fileName = file.fieldname + path.extname(file.originalname);  
    cb(null, fileName);  
  }  
});  
  
const upload = multer({ storage: storage });  
  
// 处理文件上传的路由  
router.post('/upload', upload.single('file'), function (req, res, next) {  
  if (!req.file) {  
    return res.status(400).send('No file was uploaded.');  
  }
  const fileUrl = `${access_address}/activityImage/${req.file.filename}`; // 注意：这里需要根据实际情况调整URL  
  res.json({ imageUrl: fileUrl }); // 返回文件的URL
});

router.post('/updateImgName', async (req, res) => {  
  try {  
      // 读取文件夹中的所有文件和文件夹    
      const files = await fs1.readdir(uploadDir, { withFileTypes: true });    
  
      // 过滤出文件并检查扩展名，同时检查文件名是否匹配  
      const targetFile = files.find(dirent => dirent.isFile() && dirent.name === 'file.jpg');  
  
      if (!targetFile) {  
          return res.status(404).send('未找到名为file.jpg的文件。');  
      }  
  
      const newFileName = req.body.newFileName+".jpg" || 'defaultNewName.jpg'; // 如果没有提供新文件名，则使用默认值  
      const filePath = path.join(uploadDir, targetFile.name);  
      const newFilePath = path.join(uploadDir, newFileName);  
  
      // 重命名文件  
      await fs1.rename(filePath, newFilePath);  
  
      console.log(`${targetFile.name} 已重命名为 ${newFileName}`);  
  
      // 响应客户端  
      res.send('文件已重命名。');  
  } catch (err) {  
      // 捕获并处理错误  
      console.error('在处理文件时发生错误:', err);  
      res.status(500).send('内部服务器错误');  
  }  
});  

  
// 导出路由  
module.exports = router;