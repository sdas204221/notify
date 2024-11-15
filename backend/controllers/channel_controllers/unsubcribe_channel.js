const Channel = require('../../model/channel.model');
const User = require("../../model/user.model");

 exports.unsubcribeChannel =async(req, res)=>{
    try{
        const {user_id, channel_id}=req.body;
        if (!user_id) {
            return res.status(400).json({
              success: false,
              message: "User ID is required",
            });
          }
        
          if (!channel_id) {
            return res.status(400).json({
              success: false,
              message: "channel_id is required",
            });
          } 

        const user= await User.findOne({user_id: user_id});        
        if(!user){
            res.status(404).json({success: false , massage: "Invalid User_id"})
        }

        const channel= await Channel.findOne({channel_id: channel_id});        
        if(!channel){
            res.status(404).json({success: false , massage: "Invalid channel_id"})
        }
       
        const subscribed_channels_index=user.subscribed_channels.indexOf(channel._id);
        const subscriber_ids_index = channel.subscriber_ids.indexOf(user._id);
        if (subscribed_channels_index  != -1 &&   subscriber_ids_index!= -1){
            user.subscribed_channels.splice(subscribed_channels_index,1);
            await user.save();
            channel.subscriber_ids.splice(subscriber_ids_index,1);
            await channel.save();
           return res.status(200).json({success: true , massage:"Unsubcription Successfull"});

        }else{
            return  res.status(400).json({success: false , massage: "Channel has Not subcribed  by user"});

        }

       
       

    }catch(error){
        console.error(error);
        return res.status(500).json({
            success: false,
            message: 'Internal Server Error'
        });
    }
 }