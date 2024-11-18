const User=require('../model/user.model')



const verifySessionToken =async (req,res,next)=>{
    console.log("---------------------------------------------");
    console.log("in middleware");
  //console.log(req);
  
    try{
    //console.log(req.body);
   const token=req.headers['authorization'];
  
   if(!token){
     return res.status(401).json({ message: 'Access denied. No token provided.' });
    }
    const {user_id}=req.body;
   let user;
   
if(user_id){
    user= await User.findOne({user_id: user_id});
    }
    if(!user){
      return res.status(400).json({massage: 'user not found '});
    }


if(user.session_tokens.includes(token)){
    console.log("success");
    
    next();
}
else{
res.status(403).json({ message: 'Invalid or expired token.' });
console.log("---------------------------------------------");
}

}catch(error){
    console.error( error.message);
    res.status(500).json({ message: 'Internal server error' });
    console.log("---------------------------------------------");
}
}


module.exports=verifySessionToken;