const express = require('express');
const {db_connect} = require("./config/db");
const channelRoutes = require('./routes/channel.routes');
const userRoutes=require("./routes/user.routes");
const fileRoutes = require('./routes/notice.routes');
require("dotenv").config();


db_connect();
const app = express();

app.use(express.json());

app.use('/api/channels', channelRoutes);
app.use('/api/users', userRoutes);
app.use('/files', fileRoutes); 

const PORT = process.env.PORT ;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));



