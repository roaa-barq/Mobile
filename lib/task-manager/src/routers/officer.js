const express = require("express");
const router = new express.Router();
const bcrypt = require("bcryptjs");
const Officer = require("../models/officer");
const auth = require("../middleware/auth2");

router.post("/officers", async (req, res) => {
  const officer = new Officer(req.body);
  try {
    await officer.save();
    const token = await officer.generateAuthToken();
    res.status(201).send({ officer, token });
  } catch (e) {
    res.status(400).send(e);
  }
}); /////// signup

router.post("/officers/login", async (req, res) => {
  try {
    const officer = await Officer.findByCredentials(
      req.body.Identity,
      req.body.password
    );
    const token = await officer.generateAuthToken();
    res.send({ officer, token });
  } catch (e) {
    res.status(400).send();
  }
}); /////// login

router.post("/officers/logoutAll", auth, async (req, res) => {
  try {
    req.officer.tokens = [];
    await req.officer.save();
    res.send();
  } catch (e) {
    res.status(500).send();
  }
}); //////// logoutAll

router.get("/officers/me", auth, async (req, res) => {
  res.send(req.officer);
}); ////////read

router.patch("/officers/me", auth, async (req, res) => {
  const updates = Object.keys(req.body);
  const allowedUpdates = ["name", "password", "phone"];
  const isValidOperation = updates.every((update) => {
    return allowedUpdates.includes(update);
  });

  if (!isValidOperation) {
    return res.status(400).send({ error: "invalid update" });
  }

  try {
    updates.forEach((update) => (req.officer[update] = req.body[update]));
    await req.officer.save();
    res.send(req.officer);
  } catch (e) {
    res.status(400).send();
  }
}); //////// update

//////////////// for the admin to delete officers ///////////////
router.delete("/officers/:id", async (req, res) => {
  try {
    const officer = await Officer.findByIdAndDelete(req.params.id);

    if (!officer) {
      return res.status(404).send();
    }

    res.send(officer);
  } catch (e) {
    res.status(500).send();
  }
});

////////////////// for the admin to view officers data ///////////////
router.get("/officers/:id", async (req, res) => {
  const _id = req.params.id;
  try {
    const officer = await Officer.findById(_id);
    if (!officer) {
      return res.status(404).send();
    }
    res.send(officer);
  } catch (e) {
    res.status(500).send;
  }
});

////////////////////// read all officers //////////////////
router.get("/AllOfficers", async (req, res) => {
  try {
    const officers = await Officer.find({});
    res.send(officers);
  } catch (e) {
    res.status(500).send;
  }
});

module.exports = router;
