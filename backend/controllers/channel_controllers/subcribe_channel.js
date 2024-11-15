const Channel = require('../../model/channel.model');
const User = require("../../model/user.model");

 exports.subcribeChannel =async(req, res)=>{
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
           return res.status(404).json({success: false , massage: "Invalid User_id"})
        }
         
        const channel= await Channel.findOne({channel_id: channel_id});        
        if(!channel){
          return  res.status(404).json({success: false , massage: "Invalid channel_id"})
        }
       
        if (user.subscribed_channels.indexOf(channel._id)!= -1 && 
        channel.subscriber_ids.indexOf(user._id)!= -1){
        return  res.status(400).json({success: false , massage: "Already subcribed by user"});
        }
        

        user.subscribed_channels.push(channel._id);
        await user.save();

        channel.subscriber_ids.push(user._id);
        await channel.save();
        res.status(200).json({success: true, massage:"Subcribtion Successfull"})

    }catch(error){
        console.error(error);
        return res.status(500).json({
            success: false,
            message: 'Internal Server Error'
        });
    }
 }