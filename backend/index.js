const express = require('express');
const connect_db = require("./config/db");
const channelRoutes = require('./routes/channel.routes');
const userRoutes=require("./routes/user.routes");
require("dotenv").config();


connect_db();
const app = express();

app.use(express.json());

app.use('/api/channels', channelRoutes);
app.use('/api/users', userRoutes);

const PORT = process.env.PORT ;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));



