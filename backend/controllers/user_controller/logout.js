const User = require("../../model/user.model");



exports.logOut = async (req, res) => {
    try {
        const { user_id} = req.body;
        const token=req.headers['authorization'];

        if(!user_id){
            return res.status(400).json({
                success: false,
                message: 'user id  is required',
            });
        }

        const user = await User.findOne({user_id: user_id });
        if (!user)
            return res.status(401).json({
                success: false,
                message: 'invalid user_id'
            });

    let index=user.session_tokens.indexOf(token);
    if(index!=-1){
        user.session_tokens.splice(index,1);
        await user.save();
        res.status(200).json({success: true, massage:"logout successfully"});
    }

    res.status(200).json({success: true, massage:"logout successfully"});


    


    }catch (error) {
        console.error(error);
        return res.status(500).json({
            success: false,
            message: 'an unexpected error occurred'
        });
    }
}