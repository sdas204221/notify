const { default: mongoose } = require("mongoose");
const Schema = mongoose.Schema;
const userSchema = new mongoose.Schema({
  user_id: {
    type: String,
    required: true,
    unique: true
  },
  name: {
    type: String,
    required: true
  },
  dp: {
    type: String,
    required: false
  },
  password: {
    type: String,
    required: true
  },
  email: {
    type: String,
    unique: true
  },
  subscribed_channels: [
    {
      type: Schema.Types.ObjectId,
      ref: 'channel',
    },
  ],
  privileged_channels: [
    {
      type: Schema.Types.ObjectId,
      ref: 'channel',
    },
  ],
  session_tokens: {
    type: [String]
  }
});
const User = mongoose.model("user", userSchema)

module.exports = User;