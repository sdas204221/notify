const Channel = require('../../model/channel.model');
const User = require("../../model/user.model");

 exports.getSubcribedChannels =async(req, res)=>{
    try{
        const {user_id}=req.body;
        if (!user_id) {
            return res.status(400).json({
              success: false,
              message: "User ID is required",
            });
          }
        
          const user = await User.findOne({ user_id }).populate({ 
            path: 'subscribed_channels'
           });        
        if(!user){
            res.status(404).json({success: false , massage: "Invalid User_id"})
        }

        const res_data = {
            user_id: user.user_id,
            channels: user.subscribed_channels.map((channel) => ({
               channel_id:channel.channel_id,
              name: channel.channel_name,
              dp: !channel.display_picture  ? null:channel.display_picture ,
              last_notice_number:channel.last_notice_number
            })),
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