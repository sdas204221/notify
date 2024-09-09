const express = require('express');
const channel_router = express.Router();
const createChannelController = require('../controllers/channel_controllers/create_channel');


channel_router.post('/create', createChannelController.createChannel);

module.exports = channel_router;