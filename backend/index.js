const express = require('express');
const db_connect = require("./config/db");
const channelRoutes = require('./routes/channel.routes');
const userRoutes=require("./routes/user.routes");
const noticeRoutes = require('./routes/notice.routes');
require("dotenv").config();
const cors = require('cors'); 
//const verifySessionToken=require('./middleware/verify_session_token')

db_connect();
const app = express();

app.use(express.json());
//app.use(cors());
app.use(cors({ exposedHeaders: ['Content-Disposition', 'Content-Type'] }));
//app.use(verifySessionToken);

app.use('/api/channels', channelRoutes);
app.use('/api/users', userRoutes);
app.use('/notice', noticeRoutes); 

const PORT = process.env.PORT ;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));



