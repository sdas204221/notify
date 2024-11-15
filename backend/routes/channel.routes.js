const express = require('express');
const channel_router = express.Router();
const createChannelController = require('../controllers/channel_controllers/create_channel');
const  GetSubcribedChannels =require('../controllers/channel_controllers/get_subcribed_channels')
const   SubcribeChannel=require('../controllers/channel_controllers/subcribe_channel')
const verifySessionToken=require('../middleware/verify_session_token');
const GetSubcribersNOController=require('../controllers/channel_controllers/get_subcribers_no');
const UnsubcribeChannelController=require('../controllers/channel_controllers/unsubcribe_channel')

channel_router.post('/create',verifySessionToken, createChannelController.createChannel);
channel_router.post('/getSubcribedChannels',GetSubcribedChannels.getSubcribedChannels);
channel_router.post('/subcribedChannel',SubcribeChannel.subcribeChannel);
channel_router.post('/subcribersNo',GetSubcribersNOController.getSubcribersNo);
channel_router.post('/unsubcribedChannel',UnsubcribeChannelController.unsubcribeChannel);

module.exports = channel_router;