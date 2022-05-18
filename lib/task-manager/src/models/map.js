const mongoose = require("mongoose");

const mapSchema = new mongoose.Schema({
  sizePoint: {
    type: String,
    required: true,
    unique: false,
  },
  lat: {
    type: String,
    required: true,
    unique: false,
  },
  long: {
    type: String,
    required: true,
    unique: false,
  },
});

mapSchema.methods.toJSON = function () {
  const point = this;
  const pointObject = point.toObject();
  return pointObject;
};

const map = mongoose.model("map", mapSchema);
module.exports = map;
