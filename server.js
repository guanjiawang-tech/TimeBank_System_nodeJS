const express = require('express');  
const bodyParser = require('body-parser');  
const mysql = require('mysql');  
const path = require('path');  
const cors = require('cors');  
const axios = require('axios');
const app = express();  
  
// CORS 配置  进入一个新网络测试之后查看ipv4进行添加地址，别删以前的
app.use(cors({  
  origin: ['http://localhost:5173','http://localhost:5172', 'http://192.168.101.110:5173', 'http://192.168.43.105:5173', 'http://172.16.218.157:5173']  
}));
  
// 创建数据库连接池  
const pool = mysql.createPool({  
  host: 'localhost',  
  user: 'root',  
  password: '2231030102',  
  port: 3306,  
  database: 'timebank'  
});  
  
app.use(bodyParser.json());  
  
// 静态文件目录  
app.use(express.static(path.join(__dirname, 'uploadsfile')));  
  
// 引入路由模块  
const userServerRouter = require('./routes/userServer.js');  
app.use('/userServer', userServerRouter);
const uploadServerRouter = require('./routes/uploadServer.js');  
app.use('/uploadServer', uploadServerRouter);
const activityServerRouter = require('./routes/activityServer.js');  
app.use('/activityServer', activityServerRouter);
const locationServerRouter = require('./routes/locationServer.js');  
app.use('/locationServer', locationServerRouter);
const announcementServerRouter = require('./routes/announcementServer.js');  
app.use('/announcementServer', announcementServerRouter);
const joinsServerRouter = require('./routes/joinsServer.js');  
app.use('/joinsServer', joinsServerRouter);
const forumInfoRouter = require('./routes/forumInfo.js');  
app.use('/forumInfo', forumInfoRouter);
const reviewInfoRouter = require('./routes/reviewInfo.js');  
app.use('/reviewInfo', reviewInfoRouter);
const ideasServerRouter = require('./routes/ideasServer.js');  
app.use('/ideasServer', ideasServerRouter);
const orderServerRouter = require('./routes/orderServer.js');  
app.use('/orderServer', orderServerRouter);
const activityImgRouter = require('./routes/activityImg.js');  
app.use('/activityImg', activityImgRouter);


// // 代理百度地图API请求的路由  
// app.get('/baidu-map-proxy/:path', async (req, res) => {  
//   const { path } = req.params;  
//   const fullUrl = `https://api.map.baidu.com${path}`; // 构造完整的百度地图API URL  
 
//   try {  
//     const response = await axios.get(fullUrl); // 使用axios发送GET请求  
//     res.json(response.data); // 将响应数据作为JSON返回给客户端  
//   } catch (error) {  
//     console.error('Error fetching data from Baidu Map API:', error);  
//     res.status(500).json({ error: 'Failed to fetch data from Baidu Map API' }); // 在发生错误时返回500状态码和错误消息  
//   }  
// });

app.listen(3000, () => {  
  console.log('server running at http://127.0.0.1:3000');  
});