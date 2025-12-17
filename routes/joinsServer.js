const express = require('express');  
const router = express.Router();

// 使用已有的连接池  位置在本目录下的db.js
const pool = require('./db');

// 根据活动号 查询参与者人数
router.get('/getActivityNumber', (req, res) => {
    const activeId = req.query.activeId
    pool.query("SELECT COUNT(*) AS number FROM joins WHERE activeId = ?", [activeId], (error, results, fields) => {  
      if (error) {  
        console.error(error);  
        return res.status(500).send('Internal Server Error');  
      }  
      res.json(results);  
    });  
}); 

// 更新加入
router.get('/updatejoinsByUserId', (req, res) => {
  const joinStartTime = req.query.joinStartTime
  const activeId = req.query.activeId
  const userId = req.query.userId
  pool.query("UPDATE joins SET joinStartTime = ?,stage = '已签到'  WHERE activeId = ? AND userId = ?", [joinStartTime,activeId,userId], (error, results, fields) => {  
      if (error) {  
      console.error(error);  
      return res.status(500).send('Internal Server Error');  
      }  
      res.json(results);  
  });  
});

// 更新加入
router.get('/updatejoinsByUserIdOver', (req, res) => {
  const joinStartTime = req.query.joinStartTime
  const joinOverTime = req.query.joinOverTime
  const times = req.query.times
  const activeId = req.query.activeId
  const userId = req.query.userId
  pool.query("UPDATE joins SET joinStartTime = ?, joinOverTime = ?, times = ? WHERE activeId = ? AND userId = ?", [joinStartTime,joinOverTime,times,activeId,userId], (error, results, fields) => {  
      if (error) {  
      console.error(error);  
      return res.status(500).send('Internal Server Error');  
      }  
      res.json(results);  
  });  
});

router.get('/updatejoinsTime', (req, res) => {
  const times = req.query.times
  const activeId = req.query.activeId
  const userId = req.query.userId
  pool.query("UPDATE joins SET times = ? WHERE activeId = ? AND userId = ?", [times,activeId,userId], (error, results, fields) => {  
      if (error) {  
      console.error(error);  
      return res.status(500).send('Internal Server Error');  
      }  
      res.json(results);  
  });  
});

// 更新加入
router.get('/addjoins', (req, res) => {
  const userId = req.query.userId
  const activeId = req.query.activeId
  pool.query("INSERT INTO joins VALUES (?,?,'未开始','未签到','','','00:00:00')", [userId,activeId], (error, results, fields) => {  
      if (error) {  
      console.error(error);  
      return res.status(500).send('Internal Server Error');  
      }  
      res.json(results);  
  });  
});

module.exports = router;