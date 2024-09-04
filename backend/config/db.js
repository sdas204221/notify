const { default: mongoose } = require("mongoose");
require("dotenv").config();

const db_connect=async()=>mongoose.connect(process.env.MONGODB_URI)
.then(() => console.log("mongoDB connected successfully"))
.catch((err) => console.log("mongoDB connection failed\n",err))

module.exports=db_connect;