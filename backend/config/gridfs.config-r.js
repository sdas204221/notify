const multer = require('multer');
const { GridFsStorage } = require('multer-gridfs-storage');
const crypto = require('crypto');
const path = require('path');
require('dotenv').config(); // Make sure you have a .env file to handle your MongoDB URI

// Create a storage object with a given configuration for GridFS
const storage = new GridFsStorage({
  url: process.env.MONGODB_URI, // Replace with your MongoDB connection string
  options: { useNewUrlParser: true, useUnifiedTopology: true },
  file: (req, file) => {
    return new Promise((resolve, reject) => {
      // Use crypto to generate a unique file name
      crypto.randomBytes(16, (err, buf) => {
        if (err) {
          return reject(err);
        }
        const filename = buf.toString('hex') + path.extname(file.originalname);
        const fileInfo = {
          filename: filename,
          bucketName: 'uploads' // This should match the collection name in MongoDB
        };
        resolve(fileInfo);
      });
    });
  }
});

const upload = multer({ storage });

module.exports = upload;
