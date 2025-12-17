const express = require('express');  
const router = express.Router();

// 使用已有的连接池  位置在本目录下的db.js
const pool = require('./db');

router.post('/insertusers', (req, res) => {
  const userId = req.query.userId
  const username = req.query.username
  const phone = req.query.phone
  const status = req.query.status
  const password = req.query.password
  pool.query("INSERT INTO `users` VALUES (?,?,?,?,'--',?,'--','--','留下些什么东西吧~','','')", [userId, username, phone, status, password], (error, results, fields) => {  
    if (error) {  
      console.error(error);  
      return res.status(500).send('Internal Server Error');  
    }  
    res.json(results);  
  });  
});  

// 通过证件号或手机号 与 密码登录验证操作
router.get('/goLogin', (req, res) => {
    const userId = req.query.userId
    const phone = req.query.phone
    const password = req.query.password
    const status = req.query.status
    pool.query("SELECT * FROM `users` WHERE userId = (SELECT userId FROM `users` WHERE userId = ? OR phone = ?) AND `password` = ? AND `status` = ?", [userId, phone, password, status], (error, results, fields) => {  
      if (error) {  
        console.error(error);  
        return res.status(500).send('Internal Server Error');  
      }  
      res.json(results);  
    });  
});  

// 通过证件号查询单条信息
router.get('/getUserInfo', (req, res) => {
  const userId = req.query.userId
  pool.query("SELECT * FROM `users` WHERE userId = ?", [userId], (error, results, fields) => {  
    if (error) {  
      console.error(error);  
      return res.status(500).send('Internal Server Error');  
    }  
    res.json(results);  
  });  
}); 

// 更新签名
router.get('/updateUserUsertext', (req, res) => {
  const userText = req.query.userText
  const userId = req.query.userId
  pool.query("UPDATE `users` SET userText = ? WHERE userId = ?", [userText, userId], (error, results, fields) => {  
    if (error) {  
      console.error(error);  
      return res.status(500).send('Internal Server Error');  
    }  
    res.json(results);  
  });  
}); 

// 查看多少志愿者
router.get('/getUserVolunteerNumber', (req, res) => {
  pool.query("SELECT COUNT(*) AS number FROM users WHERE `status` = '志愿者'", (error, results, fields) => {  
    if (error) {  
      console.error(error);  
      return res.status(500).send('Internal Server Error');  
    }  
    res.json(results);  
  });  
}); 

// 更新users 表的志愿
router.get('/updateUserVolunteer', (req, res) => {
  const volunteerTime = req.query.volunteerTime
  const volunteerText = req.query.volunteerText
  const userId = req.query.userId
  pool.query("UPDATE users SET volunteerTime = ?, volunteerText = ? WHERE userId = ?", [volunteerTime,volunteerText,userId], (error, results, fields) => {  
    if (error) {  
      console.error(error);  
      return res.status(500).send('Internal Server Error');  
    }  
    res.json(results);  
  });  
}); 


// 更新users 表的志愿时间
router.get('/updateUserVolunteerTime', (req, res) => {
  const hours = req.query.hours
  const minutes = req.query.minutes
  const seconds = req.query.seconds
  const userId = req.query.userId
  pool.query(`UPDATE users u
JOIN (
    SELECT
        userId,
        CONCAT(
            LPAD(CAST(SUBSTRING_INDEX(volTime, ':', 1) AS SIGNED) + ?, 2, '0'),
            ':',
            LPAD(
                CASE
                    WHEN CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(volTime, ':', 2), ':', -1) AS SIGNED) + ? >= 60
                    THEN (CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(volTime, ':', 2), ':', -1) AS SIGNED) + ?) % 60
                    ELSE CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(volTime, ':', 2), ':', -1) AS SIGNED) + ?
                END,
                2,
                '0'
            ),
            ':',
            LPAD((CAST(SUBSTRING_INDEX(volTime, ':', -1) AS SIGNED) + ?) % 60, 2, '0')
        ) AS new_volTime
    FROM users
    WHERE userId = ?
) AS time_update ON u.userId = time_update.userId
SET u.volTime = time_update.new_volTime
WHERE u.userId = ?`, [hours,minutes,minutes,minutes,seconds,userId,userId], (error, results, fields) => {  
    if (error) {  
      console.error(error);  
      return res.status(500).send('Internal Server Error');  
    }  
    res.json(results);  
  });  
}); 

// 更新users 表的志愿币活动
router.get('/updateUserVolunteerCoin', (req, res) => {
  const volCurrecy = req.query.volCurrecy
  const userId = req.query.userId
  pool.query("UPDATE users SET users.volCurrecy = CAST(users.volCurrecy AS UNSIGNED) + ? WHERE users.userId = ?", [volCurrecy,userId], (error, results, fields) => {  
    if (error) {  
      console.error(error);  
      return res.status(500).send('Internal Server Error');  
    }  
    res.json(results);  
  });  
}); 

router.get('/updateUserVolunteerCoindown', (req, res) => {
  const volCurrecy = req.query.volCurrecy
  const userId = req.query.userId
  pool.query("UPDATE users SET users.volCurrecy = CAST(users.volCurrecy AS UNSIGNED) - ? WHERE users.userId = ?", [volCurrecy,userId], (error, results, fields) => {  
    if (error) {  
      console.error(error);  
      return res.status(500).send('Internal Server Error');  
    }  
    res.json(results);  
  });  
}); 


router.get('/updateUserByCoefficient', (req, res) => {
  const coefficient = req.query.coefficient
  const userId = req.query.userId
  pool.query("UPDATE users SET users.coefficient = ? WHERE users.userId = ?", [coefficient,userId], (error, results, fields) => {  
    if (error) {  
      console.error(error);  
      return res.status(500).send('Internal Server Error');  
    }  
    res.json(results);  
  });  
}); 

module.exports = router;