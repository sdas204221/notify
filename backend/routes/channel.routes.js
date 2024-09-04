const express = require('express');
const channel_router = express.Router();
const channelController = require('../controllers/channel.controllers');


channel_router.post('/create', channelController.createChannel);

module.exports = channel_router;