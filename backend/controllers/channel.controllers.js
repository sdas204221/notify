const Channel = require('../model/channel.model');
const User = require('../model/user.model');


exports.createChannel = async (req, res) => {
  try {
    const { name, channel_id, adminUserId, category } = req.body;

    
    const adminUser = await User.find({user_id:adminUserId});
    if (!adminUser) {
      return res.status(400).json({ message: 'Admin user does not exist' });
    }

    const  existedChannelId= await User.find({channel_id:channel_id});
    if (existedChannelId) {
      return res.status(400).json({ message: 'Channel already exist' });
    }


    
    
    const newChannel = new Channel({
        channel_id: channel_id, 
        channel_name:name,
        admin_id: adminUser._id,
        category:category
    });

    
    const savedChannel = await newChannel.save();

    
    adminUser.admin_channels.push(savedChannel._id);
    await adminUser.save();

    res.status(201).json(savedChannel);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Internal Server error' });
  }
};
