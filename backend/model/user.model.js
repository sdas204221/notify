const { default: mongoose } = require("mongoose");

const userSchema = new mongoose.Schema({
    user_id: {
        type: String,
        required: true,
        unique: true
    },
    name:{
        type: String,
        required: true
    },
    password:{
        type: String,
        required: true
    },
    email:{
        type: String,
        unique:true
    },
    subscribed_channels: [
        {
          type: Schema.Types.ObjectId,
          ref: 'channel',
        },
      ],
      admin_channels: [
        {
          type: Schema.Types.ObjectId,
          ref: 'channel',
        },
      ],
});
const User=mongoose.model("user",userSchema)

module.exports = User;