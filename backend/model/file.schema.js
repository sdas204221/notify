const { default: mongoose } = require("mongoose");
const Schema = mongoose.Schema;


const fileSchema = new mongoose.Schema({
    fileName: {
      type: String,
      required: true,
    },
    fileType: {
      type: String,
      required: true,
    },
    fileData: {
      type: Buffer,
      required: true,
    },
    uploadDate: {
      type: Date,
      default: Date.now,
    },
  });
  //size
 
  const File = mongoose.model('File', fileSchema);
  
 
  module.exports = {File,fileSchema};