const express = require("express");
userController=require("../controllers/user.controllers");
const user_router=express.Router();

user_router.post("/register",userController.register);
user_router.post("/client/login",userController.loginClient);
module.exports = user_router;