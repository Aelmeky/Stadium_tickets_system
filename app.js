

      const express = require('express');
const cookieParser = require('cookie-parser');
const path = require('path')
const logger = require('morgan');
const session = require('express-session');
const sql = require('mssql');
const moment = require('moment');
const { StatusCodes } = require('http-status-codes');


const app = express();
require('dotenv').config();

const sqlConfig = {
    user: process.env.DB_USER_ADMIN,
    password: process.env.DB_PWD_ADMIN,
    database: 'test',
    server: 'localhost',
    pool: {
      max: 10,
      min: 0,
      idleTimeoutMillis: 30000
    },
    options: {
      encrypt: true, // for azure
      trustServerCertificate: true // change to true for local dev / self-signed certs
    }

}

sql.connect(sqlConfig,function(err){
  if(err) console.log(err.message)
  else{
    const request = new sql.Request()
    request.query('select * from clubsNeverScheduled',(err,records)=>{
      if(err) console.log(err.message);
      else console.log(records);
    })
  }
});

const connect = async () => {
    try {
      // make sure that any items are correctly URL encoded in the connection string
      await sql.connect(sqlConfig);
    } catch (err) {
      console.log(err.message);
    }
};

app.use(
  session({
    secret: "secret",
    resave: false,
    saveUninitialized: false,
  }),
);

//const loginRoute = require("./routes/login");

//const sportmanagerRoute = require("./routes/sportmanager");


app.set("views", path.join(__dirname, "views"));

app.set("view engine", "ejs"); // set up ejs for templating
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, 'public')));
app.get('/',(req,res)=>{
  res.render('viewHostRequest')
})

//app.use('/',sportmanagerRoute)
const port = 5000;
app.listen(
  port,
  connect().then(() => {
    console.log(`Server started on port ${port}`);
  })
);