const express = require('express');
const connect_db = require("./config/db");
// const User = require("./model/user.model")
// const Channel = require("./model/channel.model");
const channelRoutes = require('./routes/channel.routes');
require("dotenv").config();


connect_db();
const app = express();



app.use('/api/channels', channelRoutes);


const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));



