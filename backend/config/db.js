const { default: mongoose } = require("mongoose");
require("dotenv").config();
//const mongoose = require('mongoose');
//const Grid = require('gridfs-stream');
//const { GridFsStorage } = require('multer-gridfs-storage');
//onst conn = mongoose.connection;


const db_connect=async()=>mongoose.connect(process.env.MONGODB_URI)
.then(() => console.log("mongoDB connected successfully"))
.catch((err) => console.log("mongoDB connection failed\n",err))





/*let gfs;
conn.once('open', () => {
  gfs = Grid(conn.db, mongoose.mongo);
  gfs.collection('uploads'); 
});

*/


/*
//const mongoose = require('mongoose');
const { GridFSBucket } = require('mongodb');

// Your MongoDB connection URL
const mongoURI = process.env.MONGODB_URI;

const conn = mongoose.createConnection(mongoURI, {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

let gfs, gridfsBucket;

const gfs_connect = conn.once('open', () => {
  gfs = new GridFSBucket(conn.db, {
    bucketName: 'uploads', // The same bucket name you used in multer for file storage
  });
  
  //gfs = gridfsBucket; Assign to gfs for later use
  console.log('Connected to GridFS');
});

//module.exports={,gfs};
module.exports = {db_connect, gfs,gfs_connect };*/

module.exports =db_connect;
