const express = require("express");
const router = new express.Router();
const bcrypt = require("bcryptjs");
const Map = require("../models/map");
const auth = require("../middleware/authMap");

router.post("/maps", async (req, res) => {
  const map = new Map(req.body);
  try {
    await map.save();
    res.send(map);
  } catch (e) {
    res.status(400).send(e);
  }
}); /////// addData

router.get("/maps/me", auth, async (req, res) => {
  res.send(req.map);
}); ////////read

router.patch("/maps/me", auth, async (req, res) => {
  const updates = Object.keys(req.body);
  const allowedUpdates = ["sizePoint"];
  const isValidOperation = updates.every((update) => {
    return allowedUpdates.includes(update);
  });

  if (!isValidOperation) {
    return res.status(400).send({ error: "invalid update" });
  }

  try {
    updates.forEach((update) => (req.map[update] = req.body[update]));
    await req.map.save();
    res.send(req.map);
  } catch (e) {
    res.status(400).send();
  }
}); //////// update

////////////////// for the admin to view maps data ///////////////
router.get("/maps/:id", async (req, res) => {
  const _id = req.params.id;
  try {
    const map = await Map.findById(_id);
    if (!map) {
      return res.status(404).send();
    }
    res.send(map);
  } catch (e) {
    res.status(500).send;
  }
});

////////////////////// read all maps //////////////////
router.get("/AllMaps", async (req, res) => {
  try {
    const maps = await Map.find({});
    res.send(maps);
  } catch (e) {
    res.status(500).send;
  }
});

module.exports = router;
