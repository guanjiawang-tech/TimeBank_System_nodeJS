// db.js  
const mysql = require('mysql');

const pool = mysql.createPool({  
    host: 'localhost',  
    user: 'root',  
    password: '2231030102',  
    port: 3306,  
    database: 'timebank'  
});

// 导出连接池  
module.exports = pool;