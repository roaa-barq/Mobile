const jwt = require("jsonwebtoken");
const Officer = require("../models/officer");

const auth = async (req, res, next) => {
  try {
    const token = req.header("Authorization").replace("Bearer ", "");
    const decoded = jwt.verify(token, "thisisme new course");
    console.log(decoded._id);
    const officer = await Officer.findOne({
      _id: decoded._id,
      "tokens.token": token,
    });

    console.log(officer);

    if (!officer) {
      throw new Error("officer auth faild");
    }
    req.token = token;
    req.officer = officer;
    next();
  } catch (e) {
    res.status(401).send({ error: "Please authenticate" });
  }
};

module.exports = auth;
