const User = require("../../model/user.model");
const argon2=require('argon2');
const token=require('../../utils/genarate_token')


exports.loginClient = async (req, res) => {
    try {
        const { user_id, password } = req.body;
        if (!password)
            return res.status(400).json({
                success: false,
                message: 'password is required',
            });

            if (user_id) {
                user = await User.findOne({
                    user_id: user_id
                })
                
    
            if(!user){
                user = await User.findOne({
                    email: user_id.toLowerCase()
                })
            }
    
            if (!user)
                return res.status(401).json({
                    success: false,
                    message: 'invalid credentials'
                });
    
            }else{
                return res.status(400).json({
                            success: false,
                            message: 'user id or email is required',
                        });
            }

            const isPasswordValid = await argon2.verify(user.password, password);
            if(!isPasswordValid)
                return res.status(401).json({
                    success: false,
                    message: 'invalid credentials'
                });

        i = 0
        while (i <= 5) {
            const newToken = token.generateToken(20)
            if (!user.session_tokens.includes(newToken)) {
                user.session_tokens.push(newToken)
                await user.save();
                return res.status(200).json({
                    success: true,
                    session_token: newToken,
                    name: user.name,
                    user_id: user.user_id,
                    email: user.email,
                    dp: user.dp,
                    subscribed_channels: user.subscribed_channels
                });
            }
            i = i + 1;
        }




        return res.status(500).json({
            success: false,
            message: 'failed to generate a unique session token after multiple attempts'
        });

    } catch (error) {
        console.error(error);
        return res.status(500).json({
            success: false,
            message: 'an unexpected error occurred'
        });
    }
}