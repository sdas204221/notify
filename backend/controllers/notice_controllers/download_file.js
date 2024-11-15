const multer = require('multer');
const path = require('path');
const cors = require('cors');
const {File} = require('../../model/file.schema'); 
const {Notice} = require('../../model/notice.schema');
const Channel=require('../../model/channel.model');
const User=require('../../model/user.model')
const Tag=require('../../utils/valid_tags');



exports.downloadFileById=async(req,res)=>{
    try{
        const {channel_id,notice_id,file_id}=req.body;
        
    if(channel_id){
        //console.log('trying to find1');
  
         channel= await Channel.findOne({channel_id:channel_id});
         //console.log('trying to find');
  
      }

      


    }catch(error) {
        console.error('Error downloading file:', error);
        res.status(500).json({ message: 'Error downloading  file', error });
      }
}