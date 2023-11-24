 
 //CREATING AN API

 //GET, PUT, POST, DELETE, UPDATE -> CRUD

 //Import from packages
 const express = require('express');
 const mongoose = require('mongoose');
 
 
 //Import from other file
 const authRouter = require('./routes/auth');
 // import './features/auth/screens/auth_screen.dart'
 
 const PORT = 3000;
 const app = express();
 const DB = "mongodb+srv://ignitedminds326:ignitedminds326@cluster0.p6cshuq.mongodb.net/";
 //middleware : Client -> server -> client
 app.use(express.json()); 
 app.use(authRouter);
 

  //connections 
  mongoose
   .connect(DB)
   .then(() => {
   console.log("Connection successful");
  })
  .catch((e) => {
   console.log(e);
  });

 app.listen(PORT, "0.0.0.0" , () => {
    console.log(`connected at port ${PORT}`);
 });