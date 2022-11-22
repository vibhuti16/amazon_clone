const PORT = 3005;
const DB = "mongodb+srv://vibhuti16:Vibgyor*16@cluster0.r3gyc7u.mongodb.net/?retryWrites=true&w=majority";

//import from packages
const express = require("express");
const mongoose = require("mongoose");
const app = express();

//import from other files
const authRouter = require('./routes/auth');
const adminRouter = require('./routes/admin');
const productRouter = require('./routes/products');

//middleware
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);

//connections
mongoose.connect(DB).then(()=>{
    console.log("Connection Successful")
}).catch(e =>{
    console.log(e);
});


app.listen(PORT,"0.0.0.0",() => {
//npm run dev
console.log(`Connected at port ${PORT} hello`);
})