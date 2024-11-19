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

        //console.error(req.body);
        if (!channel_id) {
           
            
            return res.status(400).json({
              success: false,
              message: "channel_id is required",
            });
          }


          if (!notice_id) {
            return res.status(400).json({
              success: false,
              message: "notice_id is required",
            });
          }

          if (!file_id) {
            return res.status(400).json({
              success: false,
              message: "channel_id is required",
            });
          }
        
        
         const channel = await Channel.findOne({ channel_id });
         if(!channel){
              return res.status(404).json({success: false , massage: "Invalid Channel Id"})
         }
 
         const notice= channel.notices.find(n=>n.notice_id==notice_id);
         if(!notice){
             return res.status(404).json({success: false , massage: "Invalid Notice Id"})
        }

        const file= notice.files.find(f=>f._id==file_id);
        if(!file){
            return res.status(404).json({success: false , massage: "Invalid file Id"})
       }

       const fileBuffer = Buffer.from(file.fileData, 'base64');
       res.setHeader('Content-Disposition', `attachment; filename=${file.fileName}`);
       res.setHeader('Content-Type', file.fileType);
       return res.send(fileBuffer);

    }catch(error) {
        console.error('Error downloading file:', error);
        res.status(500).json({ message: 'Error downloading  file', error });
      }
}