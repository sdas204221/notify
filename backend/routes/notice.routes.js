const express = require('express');
const router = express.Router();
const noticeController = require('../controllers/notice_controllers/notice.controller');
const upload = require('../config/gridfs.config'); 


router.post('/create', upload.single('file'), noticeController.createNotice); 



module.exports = router;
