const {Notice} = require('../../model/notice.schema');
const Channel=require('../../model/channel.model');
const mongoose = require('mongoose');
const Grid = require('gridfs-stream');
const User=require('../../model/user.model');




exports.createNotice = async (req, res) => {
 
 
  try {
    const { notice_id, text, tags, publisher_id, time_stamp,channel_id } = req.body;
    const file_path = req.file ? req.file.filename : null; // Store the GridFS file name
    let channel;
    if(channel_id){
       channel= await Channel.findOne({channel_id:channel_id});
    }

    if(!channel){
      return res.status(400).json({success:false, massage: 'channel not found'});
}
let user;

if(publisher_id){
user= await User.findOne({user_id: publisher_id});
}

    const newNotice = new Notice({
      notice_id: notice_id,
      file_path: file_path,
      text: text,
      tags: tags,
      publisher_id: user._id ,
      time_stamp: time_stamp
    });

  
  channel.notices.push(newNotice);
  await channel.save();

    res.status(201).json({
      message: 'Notice created successfully with file',
      success: true
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({
      message: 'Error creating notice',
      error
    });
  }
};


const getFile = async(filename) => {
  //const fileName = req.params.filename;

  gfs.files.findOne({ filename: fileName }, (err, file) => {
    if (!file || file.length === 0) {
      return res.status(404).json({ message: 'No file exists' });
    }

    // Check if it's an image or file type
    if (file.contentType === 'image/jpeg' || file.contentType === 'image/png' ||
       file.contentType === 'application/pdf') {
      const readstream = gfs.createReadStream(file.filename);
      readstream.pipe(res); // Pipe the file to the response
    } else {
      res.status(404).json({ message: 'Not an image or supported file type' });
    }
  });
};




exports.getNoticeById =async(req,res)=>{
  try{
    const {channel_id , notice_id}=req.body;
    let channel, notice, fileName;
    if(channel_id){
      channel=  await Channel.findOne({channel_id:channel_id});
    }
    
    if(!channel){
      return res.status(404).json({success: false , massage:'Channel not Found'});
    }

    notice= await channel.notices.find((n) => n.notice_id === notice_id);

    if(!notice){
      return res.status(404).json({success: false , massage:'notice not Found'});
    }

    fileName=notice.file_path;

    gfs.files.findOne({ filename: fileName }, (err, file) => {
      if (!file || file.length === 0) {
        return res.status(404).json({ message: 'No file exists' });
      }
  
      // Check if it's an image or file type
      if (file.contentType === 'image/jpeg' || file.contentType === 'image/png' ||
         file.contentType === 'application/pdf') {
        const readstream = gfs.createReadStream(file.filename);
        readstream.pipe(res); // Pipe the file to the response
      } else {
        res.status(404).json({ message: 'Not an image or supported file type' });
      }
    });

    return res.status(200).json({success: true, massage:'Notice fetch successfully', notice});




  }catch  (error) {
    console.error(error);
    res.status(500).json({
      message: 'Error creating notice',
      error
    });
  }
}
