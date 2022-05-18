const mongoose = require("mongoose");
const validator = require("validator");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");

const officerSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true,
    trim: true,
  },
  Identity: {
    type: String,
    required: true,
    unique: true,
    trim: true,
    validate(value) {
      if (!validator.isNumeric(value)) {
        throw new Error("Identity is invalid");
      }
    },
  },
  password: {
    type: String,
    required: true,
    trim: true,
    minLength: 7,
    validate(value) {
      if (value.toLowerCase().includes("password")) {
        throw new Error('password cannot contain "password"');
      }
    },
  },

  phone: {
    type: String,
    validate(value) {
      if (!validator.isNumeric(value)) {
        throw new Error("Invalid supscription number is invalid");
      }
    },
  },
  tokens: [
    {
      token: {
        type: String,
        required: true,
      },
    },
  ],
});

officerSchema.methods.toJSON = function () {
  const officer = this;
  const officerObject = officer.toObject();
  delete officerObject.tokens;
  return officerObject;
};

officerSchema.methods.generateAuthToken = async function () {
  const officer = this;
  const token = jwt.sign(
    { _id: officer._id.toString() },
    "thisisme new course"
  );

  officer.tokens = officer.tokens.concat({ token });
  await officer.save();
  return token;
};

officerSchema.statics.findByCredentials = async (Identity, password) => {
  const officer = await Officer.findOne({ Identity });

  if (!officer) {
    throw new Error("unable to login");
  }

  const isMatch = await bcrypt.compare(password, officer.password);

  if (!isMatch) {
    throw new Error("Unable to login ");
  }

  return officer;
};

officerSchema.pre("save", async function (next) {
  const officer = this;
  if (officer.isModified("password")) {
    officer.password = await bcrypt.hash(officer.password, 8);
  }

  next();
});

const Officer = mongoose.model("Officer", officerSchema);

module.exports = Officer;
