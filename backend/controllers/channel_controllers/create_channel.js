const Channel = require('../../model/channel.model');
const User = require("../../model/user.model");


exports.createChannel = async (req, res) => {
  try {
    const { name, channel_id, user_id, category ,display_picture,type_of_taged_users} = req.body;

    if (!user_id)
        return res.status(400).json({
            success: false,
            message: 'Admin User Id id is required',
        });
    if (!name)
         return res.status(400).json({
            success: false,
            message: ' Channel name  is required',
        });
    if (!channel_id)
        return res.status(400).json({
            success: false,
            message: 'Channel id is required',
        });
   
    
    const adminUser = await User.findOne({user_id:user_id});
    // console.log(adminUser);
    // console.log(adminUser._id);

    if (!adminUser) {
      return res.status(400).json({
        success: false,
        message: 'Admin user does not exist' });
    }
    
    const newChannel = new Channel({
        channel_id: channel_id, 
        channel_name:name,
        admin_id: adminUser._id,
        category:category,
        display_picture:display_picture,
        type_of_taged_users:type_of_taged_users,
        notices:[{
            notice_id:channel_id+'#',
            publisher_id:adminUser._id,
            time_stamp: new Date()
        }]
    });

    newChannel.moderator_ids.push(adminUser._id);
    const savedChannel = await newChannel.save();
    console.log("Channel created");

    
    adminUser.privileged_channels.push(savedChannel._id);
    await adminUser.save();

    res.status(201).json({
        success: true,
        message: 'Channel created successfully' });
  } catch (error) {

    if (error.code === 11000)//MongoServerError: E11000 duplicate key error
    {
        if (error.keyValue.channel_id)
            return res.status(400).json({
                success: false,
                message: 'Channel id already exists'
            });


    }

    console.error(error);
    return res.status(500).json({
        success: false,
        message: 'Internal Server Error'
    });
}
};
