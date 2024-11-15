const Channel = require('../../model/channel.model');
const User = require("../../model/user.model");

 exports.getNoticeByID =async(req, res)=>{
    try{
        const {channel_id,notice_id}=req.body;
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
        
          const channel = await Channel.findOne({ channel_id });
        if(!channel){
             return res.status(404).json({success: false , massage: "Invalid Channel Id"})
        }

        const notice= channel.notices.find(n=>n.notice_id==notice_id);
        if(!notice){
            return res.status(404).json({success: false , massage: "Invalid Notice Id"})
       }

       const res_data= {
        notice_id :notice.notice_id,
        text: !notice.text ? null :notice.text,
        tags: notice.tags.length >0 ?notice.tags: [],
        time_stamp: !notice.time_stamp ? null :notice.time_stamp,
        file_id : notice.files.length >0 ? notice.files.map((f)=>f._id) : []

       }
        
        res.status(200).json({data:res_data})


    }catch(error){
        console.error(error);
        return res.status(500).json({
            success: false,
            message: 'Internal Server Error'
        });
    }
 }