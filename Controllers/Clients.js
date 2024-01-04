const moment = require("moment");
const Clients = require("../Models/Clients");

exports.addOneClient = async (req, res) => {
  const now = moment();
  const toInsert = {
    nameOfUser: req.user.name,
    name: req.body.name,
    email: req.body.email,
    phoneNumber: req.body.phoneNumber,
    birthday: req.body.birthday,
    timestamp: now.unix(),
  }

  try {
    await Clients.insertOne(toInsert);
    return res.status(200).json({ create: true, });
  } catch (error) {
    return res.status(500).json({ error: true, })
  }
}

exports.updateOneClient = async (req, res) => {
  const toUpdate = {
    nameOfUser: req.user.name,
    name: req.body.name,
    email: req.body.email,
    phoneNumber: req.body.phoneNumber,
    birthday: req.body.birthday,
  }

  try {
    await Clients.update(toUpdate, { idClient: req.params.idClient });
    return res.status(200).json({ update: true, });
  } catch (error) {
    return res.status(500).json({ error: true, })
  }
}

exports.getOneClient = async (req, res) => {
  return res.status(200).json({ find: true, result: req.client });
}

exports.getAllClient = async (req, res) => {
  try {
    const clients = await Clients.customQuery("SELECT * FROM clients", []);
    return res.status(200).json({ find: true, result: clients });
  } catch (error) {
    console.log(error);
    return res.status(500).json({ error: true });
  }
}

exports.deleteOneClient = async (req, res) => {
  try {
    await Clients.delete({ idClient: req.params.idClient });
    return res.status(200).json({ delete: true, });
  } catch (error) {
    return res.status(500).json({ error: true });
  }
}