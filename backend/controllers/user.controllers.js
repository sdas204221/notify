const User = require("../model/user.model");

exports.register = async (req, res) => {
    try {
        const { user_id, password, dp, name, email } = req.body;
        if (!user_id)
            return res.status(400).json({
                success: false,
                message: 'User ID is required',
            });

        if (!password)
            return res.status(400).json({
                success: false,
                message: 'Password is required',
            });

        if (!name)
            return res.status(400).json({
                success: false,
                message: 'Name is required',
            });

        const user = new User({
            user_id: user_id.toLowerCase(),
            password: password,
            name: name.toLowerCase()
        })

        if (dp) user.db = dp;
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
                    message: 'User Id already exists'
                });

            if (error.keyValue.email)
                return res.status(400).json({
                    success: false,
                    message: 'Email already exists'
                });

        }

        console.error(error);
        return res.status(500).json({
            success: false,
            message: 'An unexpected error occurred'
        });
    }

}