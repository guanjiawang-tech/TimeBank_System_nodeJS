const express = require('express');  
const router = express.Router();

// 使用已有的连接池  位置在本目录下的db.js
const pool = require('./db');

// 查询没被接取的表单
router.get('/getNeedOrder', (req, res) => {
    pool.query("SELECT * FROM `orders` JOIN users ON (orders.userId = users.userId) WHERE volunteerUserId = ''", (error, results, fields) => {  
      if (error) {  
        console.error(error);  
        return res.status(500).send('Internal Server Error');  
      }  
      res.json(results);  
    });  
});  

// 通过志愿者id 查询没被接取的表单
router.get('/getOrderByVolunteerId', (req, res) => {
    const volunteerUserId = req.query.volunteerUserId
    pool.query("SELECT * FROM `orders` JOIN users ON (orders.volunteerUserId = users.userId) WHERE orders.volunteerUserId = ?", [volunteerUserId], (error, results, fields) => {  
      if (error) {  
        console.error(error);  
        return res.status(500).send('Internal Server Error');  
      }  
      res.json(results);  
    });  
});  
// 通过志愿者id 查询没被接取的表单
router.get('/getOrderByVolunteerId1', (req, res) => {
  const volunteerUserId = req.query.volunteerUserId
  pool.query("SELECT * FROM `orders` JOIN users ON (orders.volunteerUserId = users.userId) WHERE orders.UserId = ?", [volunteerUserId], (error, results, fields) => {  
    if (error) {  
      console.error(error);  
      return res.status(500).send('Internal Server Error');  
    }  
    res.json(results);  
  });  
}); 

// 更新操作
router.get('/updateOrderByOrderId', (req, res) => {
  const dateInfo = req.query.dateInfo
  const orderId = req.query.orderId
  const stage = req.query.stage
  pool.query("UPDATE `orders` SET `dateInfo` = CONCAT(`dateInfo`, ?), stage = ? WHERE `orderId`= ?", [dateInfo,stage,orderId], (error, results, fields) => {  
    if (error) {  
      console.error(error);  
      return res.status(500).send('Internal Server Error');  
    }  
    res.json(results);  
  });  
}); 

// 更新操作
router.get('/updateOrderByvolunteerUserId', (req, res) => {
  const volunteerUserId = req.query.volunteerUserId
  const dateInfo = req.query.dateInfo
  const orderId = req.query.orderId
  pool.query("UPDATE `orders` SET orders.volunteerUserId = ?, orders.dateInfo = ? WHERE orderId = ?", [volunteerUserId,dateInfo,orderId], (error, results, fields) => {  
    if (error) {  
      console.error(error);  
      return res.status(500).send('Internal Server Error');  
    }  
    res.json(results);  
  });  
}); 

// 添加
router.get('/addOrder', (req, res) => {
  const orderId = req.query.orderId
  const userId = req.query.userId
  const orderType = req.query.orderType
  const orderText = req.query.orderText
  const joinId = req.query.joinId
  pool.query("INSERT INTO orders VALUES (?,?,?,?,'','','',?)", [orderId,userId,orderType,orderText,joinId], (error, results, fields) => {  
    if (error) {  
      console.error(error);  
      return res.status(500).send('Internal Server Error');  
    }  
    res.json(results);  
  });  
});  

// 查询所有数据
router.get('/getAllOrderByStage', (req, res) => {
  pool.query("SELECT orders.*, u1.username username1, u1.phone phone1, u2.username username2, u2.phone phone2, u1.coefficient, SUBSTRING_INDEX(dateinfo, '-', 3) AS start_time, SUBSTRING_INDEX(SUBSTRING_INDEX(dateinfo, '-', -3), '-', -4) AS end_time, TIMEDIFF(STR_TO_DATE(SUBSTRING_INDEX(SUBSTRING_INDEX(dateinfo, '-', -3), '-', -4), '%Y-%m-%d %H:%i:%s'),STR_TO_DATE(SUBSTRING_INDEX(dateinfo, '-', 3), '%Y-%m-%d %H:%i:%s')) AS time_difference FROM `orders` JOIN users u1 ON (orders.userId = u1.userId)  JOIN users u2 ON (orders.volunteerUserId = u2.userId) WHERE orders.stage = '待审核'", (error, results, fields) => {  
    if (error) {  
      console.error(error);  
      return res.status(500).send('Internal Server Error');  
    }  
    res.json(results);  
  });  
});  


// 更新状态
router.get('/UpdateOrderByStage', (req, res) => {
  const stage = req.query.stage
  const orderId = req.query.orderId
  pool.query("UPDATE orders SET orders.stage = ? WHERE orders.orderId = ?", [stage,orderId], (error, results, fields) => {  
    if (error) {  
      console.error(error);  
      return res.status(500).send('Internal Server Error');  
    }  
    res.json(results);  
  });  
});  

module.exports = router;