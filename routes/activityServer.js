const express = require('express');  
const router = express.Router();

// 使用已有的连接池  位置在本目录下的db.js
const pool = require('./db');

// 通过证件号或手机号 与 密码登录验证操作
router.get('/getActivityByLocation', (req, res) => {  
    const activityLocation = req.query.activityLocation;  
    let query = `  
      SELECT   
        a.*,  
        COUNT(j.activeId) AS joinCount  
      FROM   
        activities a  
      JOIN   
        locationinfo l ON l.locationNo = a.activityLocationNo  
      LEFT JOIN   
        joins j ON j.activeId = a.activityId  
    `;  
    let values = [];  
    let groupByClause = `  
      GROUP BY   
        a.activityId, a.activityName, a.activityStartTime, -- 以及其他a表中的必要列  
        l.locationNo, l.locationInfoProvinces, l.locationInfoCities, l.locationInfoCounties  
    `;  
    
    if (activityLocation) {  
      // 如果 activityLocation 有值，则添加 WHERE 子句和对应的参数  
      query += ` WHERE l.locationInfoProvinces = ? OR l.locationInfoCities = ? OR l.locationInfoCounties = ?`;  
      values = [activityLocation, activityLocation, activityLocation];  
    }  
    
    // 添加排序子句（无论是否有WHERE子句，都进行排序）  
    query += ` ORDER BY a.activityStartTime DESC`;  
    
    // 将 GROUP BY 子句添加到查询中（在 WHERE 子句之后，ORDER BY 子句之前）  
    query = query.replace('ORDER BY', groupByClause + ' ORDER BY');  
    
    pool.query(query, values, (error, results, fields) => {  
      if (error) {  
        console.error(error);  
        return res.status(500).send('Internal Server Error');  
      }  
      res.json(results);  
    });  
  });

// 模糊查询
router.get('/getActivityBySome', (req, res) => {
    const info = req.query.info
    pool.query(`SELECT   
    a.*,  
    COUNT(j.activeId) AS joinCount  
FROM   
    activities a  
JOIN   
    locationinfo l ON l.locationNo = a.activityLocationNo  
JOIN   
    users u ON a.activityUserId = u.userId  
LEFT JOIN   
    joins j ON j.activeId = a.activityId  
WHERE   
    (l.locationInfoProvinces LIKE ? OR    
     l.locationInfoCities LIKE ? OR    
     l.locationInfoCounties LIKE ? OR    
     a.activityName LIKE ? OR  
     a.activityLocationInfo LIKE ? OR    
     u.username LIKE ?)  
GROUP BY   
    a.activityId, a.activityName, a.activityStartTime,
    l.locationNo, l.locationInfoProvinces, l.locationInfoCities, l.locationInfoCounties,  
    u.userId, u.username  
ORDER BY   
    a.activityStartTime;`, [info,info,info,info,info,info], (error, results, fields) => {  
      if (error) {  
        console.error(error);  
        return res.status(500).send('Internal Server Error');  
      }  
      res.json(results);  
    });  
}); 

// 通过userid 查活动
router.get('/getActivityByUserid', (req, res) => {
  const userid = req.query.userid
  pool.query("SELECT * FROM `activities` JOIN users ON (activities.activityUserId = users.userId) JOIN joins ON (joins.activeId = activities.activityId) WHERE joins.userId = ? AND joins.stage = '未签到'", [userid], (error, results, fields) => {  
      if (error) {  
      console.error(error);  
      return res.status(500).send('Internal Server Error');  
      }  
      res.json(results);  
  });  
});

// 通过activityid 查活动
router.get('/getActivityByactivityId', (req, res) => {
  const activityId = req.query.activityId
  pool.query("SELECT * FROM `activities` JOIN users ON (activities.activityUserId = users.userId) WHERE activities.activityId = ?", [activityId], (error, results, fields) => {  
      if (error) {  
      console.error(error);  
      return res.status(500).send('Internal Server Error');  
      }  
      res.json(results);  
  });  
});

// 管理查看
router.get('/getActivityByManage', (req, res) => {
  const userid = req.query.userid
  pool.query("SELECT * FROM `activities` JOIN users ON (activities.activityUserId = users.userId) WHERE users.userId = ?", [userid], (error, results, fields) => {  
      if (error) {  
      console.error(error);  
      return res.status(500).send('Internal Server Error');  
      }  
      res.json(results);  
  });  
});

// 添加活动  INSERT INTO `activities` VALUES (?,?,?,?,?,?,?,?,'')
router.get('/addActivity', (req, res) => {
  const activityId = req.query.activityId
  const activityName = req.query.activityName
  const activityLocationNo = req.query.activityLocationNo
  const activityUserId = req.query.activityUserId
  const activityStartTime = req.query.activityStartTime
  const activityOverTime = req.query.activityOverTime
  const activityVolunteerNumber = req.query.activityVolunteerNumber
  const activityLocationInfo = req.query.activityLocationInfo
  pool.query("INSERT INTO `activities` VALUES (?,?,?,?,?,?,?,?,'','未开始')", [activityId,activityName,activityLocationNo,activityUserId,activityStartTime,activityOverTime,activityVolunteerNumber,activityLocationInfo], (error, results, fields) => {  
      if (error) {  
      console.error(error);  
      return res.status(500).send('Internal Server Error');  
      }  
      res.json(results);  
  });  
});

// 通过userid 查活动 已签到
router.get('/getActivityByUseridFinish', (req, res) => {
  const userid = req.query.userid
  pool.query("SELECT * FROM `activities` JOIN users ON (activities.activityUserId = users.userId) JOIN joins ON (joins.activeId = activities.activityId) WHERE joins.userId = ? AND joins.stage = '已签到'", [userid], (error, results, fields) => {  
      if (error) {  
      console.error(error);  
      return res.status(500).send('Internal Server Error');  
      }  
      res.json(results);  
  });  
});

// 通过userid 查活动 已结束
router.get('/getActivityByUseridOver', (req, res) => {
  const userid = req.query.userid
  pool.query("SELECT * FROM `activities` JOIN users ON (activities.activityUserId = users.userId) WHERE activities.activityUserId = ? AND activities.stage = '已结束'", [userid], (error, results, fields) => {  
      if (error) {  
      console.error(error);  
      return res.status(500).send('Internal Server Error');  
      }  
      res.json(results);  
  });  
});

// 通过userid 查活动 签到
router.get('/getActivityByUseridAllManage', (req, res) => {
  const userid = req.query.userid
  pool.query("SELECT * FROM `activities` JOIN users ON (activities.activityUserId = users.userId) WHERE activities.activityUserId = ? AND activities.stage = '未开始'", [userid], (error, results, fields) => {  
      if (error) {  
      console.error(error);  
      return res.status(500).send('Internal Server Error');  
      }  
      res.json(results);  
  });  
});

// 更新签到码
router.get('/updateActivityByactivitId', (req, res) => {
  const signinCode = req.query.signinCode
  const activityId = req.query.activityId
  pool.query("UPDATE activities SET signinCode = ? WHERE activityId = ?", [signinCode,activityId], (error, results, fields) => {  
      if (error) {  
      console.error(error);  
      return res.status(500).send('Internal Server Error');  
      }  
      res.json(results);  
  });  
});

module.exports = router;