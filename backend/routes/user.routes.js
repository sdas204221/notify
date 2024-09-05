const express = require("express");
userController=require("../controllers/user.controllers");
const user_router=express.Router();

user_router.post("/register",userController.register);
module.exports = user_router;