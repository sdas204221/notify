const mongoose = require('mongoose');
const express = require("express");
const multer = require('multer');
const path = require('path');
const noticeController = require('../controllers/notice_controllers/create_notice');
const verifySessionToken=require('../middleware/verify_session_token');
const  isModarator=require('../middleware/is_modarator');


const storage = multer.memoryStorage(); // Store file data in memory buffer
const upload = multer({ storage });

const file_routes=express.Router();


file_routes.post('/create',upload.array('files'), verifySessionToken,isModarator,noticeController.createNotice)


module.exports = file_routes;