const express = require('express');
const channel_router = express.Router();
const createChannelController = require('../controllers/channel_controllers/create_channel');
const verifySessionToken=require('../middleware/verify_session_token');

channel_router.post('/create',verifySessionToken, createChannelController.createChannel);

module.exports = channel_router;