const express = require('express');    
const multer = require('multer');    
const fs = require('fs');    
const path = require('path'); // 引入 path 模块来处理文件路径   
const router = express.Router();
  
const app = express(); // 创建 Express 应用实例  
  
const uploadDir = './../TimeBank_System_miniprograme/static/headimages';

// 检查文件夹是否存在，如果不存在则创建    
if (!fs.existsSync(uploadDir)) {    
  fs.mkdirSync(uploadDir);    
  console.log('创建上传文件夹成功');    
}

  
// 配置 multer 中间件来处理文件上传    
const storage = multer.diskStorage({    
  destination: function (req, file, cb) {    
    cb(null, uploadDir); // 使用正确的路径    
  },    
  filename: function (req, file, cb) {   
    const userId = req.body.userid; // 从请求中获取用户ID  
    const fileExt = path.extname(file.originalname); // 获取文件扩展名  
    const newFileName = `${userId}${fileExt}`; // 生成新的文件名  
    cb(null, newFileName); // 回调新的文件名  
  }    
});    
  
const upload = multer({ storage: storage });    

router.use('/upload', (req, res, next) => {  
    // 注意：这里不能直接删除文件，因为文件还没被上传  
    const userId = req.body.userid;
    if (userId) {
      req.body.userid = `${userId}-${Date.now()}`;  
    }
    next();
  });

// 处理文件上传的路由    
router.post('/upload', upload.single('photo'), (req, res) => {    
  if (!req.file) {    
    return res.status(400).send('No file was uploaded.');    
  }    
    
  res.send('File uploaded successfully!');    
  // 你可以在这里进一步处理文件，比如保存到数据库等    
});    

// 将路由器挂载到 Express 应用上  
app.use('/', router); // 这里的 '/' 表示将路由器挂载到根路径上  
  

  
// 注意：你现在应该通过 URL http://127.0.0.1:3000/upload 来访问上传路由
  
module.exports = router;