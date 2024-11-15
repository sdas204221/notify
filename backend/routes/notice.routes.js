const mongoose = require('mongoose');
const express = require("express");
const multer = require('multer');
const path = require('path');
const createNoticeController = require('../controllers/notice_controllers/create_notice');
const verifySessionToken=require('../middleware/verify_session_token');
const  isModarator=require('../middleware/is_modarator');

const  getNoticeListController =require('../controllers/notice_controllers/get_notice_list');
const getNoticeByIDController= require('../controllers/notice_controllers/get_notice_by_id');
const GetNoticeByNoticeNoController = require('../controllers/notice_controllers/get_notice_by_notice_no');


const storage = multer.memoryStorage(); // Store file data in memory buffer
const upload = multer({ storage });

const notice_routes=express.Router();


notice_routes.post('/create',upload.array('files'), verifySessionToken,isModarator,createNoticeController.createNotice)
notice_routes.post('/getNotices',getNoticeListController.getNoticeList);
notice_routes.post('/getNoticeByID',getNoticeByIDController.getNoticeByID);
notice_routes.post('/getNoticeByNoticeNo',GetNoticeByNoticeNoController.getNoticeByNoticeNo);


module.exports = notice_routes;