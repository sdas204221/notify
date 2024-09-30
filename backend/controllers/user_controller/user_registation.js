const User = require("../../model/user.model");
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