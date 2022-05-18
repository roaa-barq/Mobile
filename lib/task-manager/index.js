const express = require("express");
require("./src/db/mongoose");
const userRouter = require("./src/routers/user");
const officerRouter = require("./src/routers/officer");
const adminRouter = require("./src/routers/admin");
const mapRouter = require("./src/routers/map");

// var cors = require("cors");

const app = express();
// app.use(cors());
const port = process.env.PORT || 3080;
app.use(express.json());
app.use(userRouter);
app.use(officerRouter);
app.use(adminRouter);
app.use(mapRouter);

app.listen(port, () => {
  console.log("server is up on port " + port);
});
