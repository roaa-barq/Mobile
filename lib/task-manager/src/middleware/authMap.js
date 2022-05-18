const jwt = require("jsonwebtoken");
const Map = require("../models/map");

const auth = async (req, res, next) => {
  try {
    const token = req.header("Authorization").replace("Bearer ", "");
    const decoded = jwt.verify(token, "thisisme new course");
    console.log(decoded._id);
    const map = await Map.findOne({
      _id: decoded._id,
      "tokens.token": token,
    });

    console.log(map);

    if (!map) {
      throw new Error("map auth faild");
    }
    req.token = token;
    req.map = map;
    next();
  } catch (e) {
    res.status(401).send({ error: "Please authenticate" });
  }
};

module.exports = auth;
