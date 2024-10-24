const { default: mongoose } = require("mongoose");
require("dotenv").config();
//const mongoose = require('mongoose');
const Grid = require('gridfs-stream');
const { GridFsStorage } = require('multer-gridfs-storage');
const conn = mongoose.connection;


const db_connect=async()=>mongoose.connect(process.env.MONGODB_URI)
.then(() => console.log("mongoDB connected successfully"))
.catch((err) => console.log("mongoDB connection failed\n",err))





let gfs;
conn.once('open', () => {
  gfs = Grid(conn.db, mongoose.mongo);
  gfs.collection('uploads'); 
});

module.exports={db_connect,gfs};