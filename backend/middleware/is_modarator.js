const Channel=require('../model/channel.model');
const User=require('../model/user.model');




const isModarator=async(req,res,next)=>{
    try{
        console.log('inside isModarator MiddleWare');
        
        const{user_id,channel_id}=req.body;
        if(channel_id){
             channel= await Channel.findOne({channel_id:channel_id});
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

      if(!channel.moderator_ids.includes(user._id)){
        return res.status(400).json({ massage: 'User have not modarator access'});
      }else{
        next();
      }

    }catch(error){
            res.status(500).json({ message: 'Internal Server Error', error });
    }
}


module.exports=isModarator;