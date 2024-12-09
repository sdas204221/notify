const express = require("express");
const userRegistrationController=require("../controllers/user_controller/user_registation");
const clientLoginController=require("../controllers/user_controller/client_login");
const logoutController=require("../controllers/user_controller/logout");
const verifySessionToken=require('../middleware/verify_session_token');

const user_router=express.Router();

user_router.post("/register",userRegistrationController.register);
user_router.post("/client/login",clientLoginController.loginClient);
// user_router.post("/admin/login",userController.loginAdmin);
user_router.post("/logout",verifySessionToken,logoutController.logOut);
module.exports = user_router;