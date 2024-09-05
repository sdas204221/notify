const User = require("../model/user.model");
const crypto = require('crypto');
const argon2=require('argon2');

exports.register = async (req, res) => {
    try {
        const { user_id, password, dp, name, email } = req.body;
        if (!user_id)
            return res.status(400).json({
                success: false,
                message: 'user id is required',
            });

        if (!password)
            return res.status(400).json({
                success: false,
                message: 'password is required',
            });

        if (!name)
            return res.status(400).json({
                success: false,
                message: 'name is required',
            });

            const hashedPassword = await argon2.hash(password);
        const user = new User({
            user_id: user_id.toLowerCase(),
            password: hashedPassword,
            name: name.toLowerCase()
        })

        if (dp) user.dp = dp;
        if (email) user.email = email.toLowerCase();
        await user.save();

        return res.status(201).json({ success: true });
    }
    catch (error) {

        if (error.code === 11000)//MongoServerError: E11000 duplicate key error
        {
            if (error.keyValue.user_id)
                return res.status(400).json({
                    success: false,
                    message: 'user id already exists'
                });

            if (error.keyValue.email)
                return res.status(400).json({
                    success: false,
                    message: 'email already exists'
                });

        }

        console.error(error);
        return res.status(500).json({
            success: false,
            message: 'an unexpected error occurred'
        });
    }

}



function generateToken(length) {
    const buffer = crypto.randomBytes(length);
    let base64Token = buffer.toString('base64');
    base64Token = base64Token.replace(/[/+=]/g, '').slice(0, length);
    return base64Token;
}

exports.loginClient = async (req, res) => {
    try {
        const { user_id, password, email } = req.body;
        if (!password)
            return res.status(400).json({
                success: false,
                message: 'password is required',
            });

        if (user_id) {
            user = await User.findOne({
                user_id: user_id
            })

        } else if (email) {
            user = await User.findOne({
                email: email
            })

        } else {
            return res.status(400).json({
                success: false,
                message: 'user id or email is required',
            });
        }

        if (!user)
            return res.status(401).json({
                success: false,
                message: 'invalid credentials'
            });
            const isPasswordValid = await argon2.verify(user.password, password);
            if(!isPasswordValid)
                return res.status(401).json({
                    success: false,
                    message: 'invalid credentials'
                });


        i = 0
        while (i <= 5) {
            const newToken = generateToken(20)
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