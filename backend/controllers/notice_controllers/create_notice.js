
const mongoose = require('mongoose');
const multer = require('multer');
const path = require('path');
const cors = require('cors');
const {File} = require('../../model/file.schema'); 
const {Notice} = require('../../model/notice.schema');
const Channel=require('../../model/channel.model');
const User=require('../../model/user.model')
const Tag=require('../../utils/valid_tags');





exports.createNotice= async (req, res) => {
  console.log("---------------------------------------------");
  console.log("in create notice controller");
  //console.log(req);
  console.log("---------------------------------------------");
  
  try {
    const {  text, tags, user_id,channel_id } = req.body;
    let channel;
    

    if(channel_id){
      //console.log('trying to find1');

       channel= await Channel.findOne({channel_id:channel_id});
       //console.log('trying to find');

    }

    if(!channel){
      return res.status(400).json({ massage: 'channel not found'});
  }
let user;

if(user_id){
user= await User.findOne({user_id: user_id});
}
if(!user){
  return res.status(400).json({massage: 'user not found'});
}

  //console.log(req.files);
    //const file = req.file;
    if (!req.files ||req.files.length ==0) {
      return res.status(403).json({ message: 'No file uploaded' });
    }
    let tagarray=[];
    console.log("printing inside controller");
    console.log(tags);
    
    if(tags){

      tagarray=JSON.parse(tags);
      //console.log(tagarray.length);
      if(tagarray.length==1 & tagarray[0]==""){
        tagarray=[];
      }else{
      if(!Tag.isValidTags(tagarray,channel.type_of_taged_users)){
        return res.status(400).json({massage: 'invalid tags'});
      }}
    }
    console.log(tagarray);
   let notice_id= channel.channel_id+(channel.last_notice_number +1);
   channel.last_notice_number=channel.last_notice_number +1;
   
    const newNotice = new Notice({
      notice_id: notice_id,
      
      text: text,
      tags: tagarray,
      publisher_id: user._id ,
      
    });
    console.log('new notice created');
    //console.log(newNotice);

     req.files.map(file => {
      let newFile = new File({
        fileName: file.originalname,
        fileType: file.mimetype,
        fileData: file.buffer
      });
      newNotice.files.push(newFile);
    });


   //` console.log('file pushed');

    channel.notices.push(newNotice);
    console.log('notice pushed');
    //console.log(channel);

    await channel.save();



   
    res.status(201).json({ message: 'File uploaded successfully'});
  } catch (error) {
    console.error('Error uploading file:', error);
    res.status(500).json({ message: 'Error uploading file', error });
  }

   // console.log(req.file);
};
//tags, timestamp