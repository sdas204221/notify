const { default: mongoose } = require("mongoose");

const userSchema = new mongoose.Schema({
    user_id: {
        type: String,
        required: true,
        unique: true
    },
    Name:{
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
    subscribed_channels:{
        type: [String]
    },
    authorised_channels:{
        type: [String]
    }
});
const User=mongoose.model("user",userSchema)