const express = require("express");
userController=require("../controllers/user.controllers");
const user_router=express.Router();

user_router.post("/register",userController.register);
user_router.post("/client/login",userController.loginClient);
user_router.post("/admin/login",userController.loginAdmin);
module.exports = user_router;