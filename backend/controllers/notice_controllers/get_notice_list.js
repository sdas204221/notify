const Channel = require('../../model/channel.model');
const User = require("../../model/user.model");

 exports.getNoticeList =async(req, res)=>{
    try{
        const {channel_id}=req.body;
        if (!channel_id) {
            return res.status(400).json({
              success: false,
              message: "channel_id is required",
            });
          }
        
          const channel = await Channel.findOne({ channel_id });
        if(!channel){
             return res.status(404).json({success: false , massage: "Invalid Channel Id"})
        }

        const res_data = {
            channel: channel.channel_id,
            notices: channel.notices.map((n)=>n.notice_id)
          };       
           res.status(200).json({data:res_data});


    }catch(error){
        console.error(error);
        return res.status(500).json({
            success: false,
            message: 'Internal Server Error'
        });
    }
 }