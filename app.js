const express = require('express');
const cookieParser = require('cookie-parser');
const path = require('path')
const logger = require('morgan');
const session = require('express-session');
const sql = require('mssql');
const moment = require('moment');
const { StatusCodes } = require('http-status-codes');

const sqlConfig = {
    user: process.env.DB_USER,
    password: process.env.DB_PWD,
    database: process.env.DB_NAME,
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




app.set('view engine', 'ejs');
app.set("views", path.join(__dirname, "views"));

app.set("view engine", "ejs"); // set up ejs for templating
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(express.static(path.join(".", "public", "images")));


app.listen(5000);


