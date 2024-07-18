const db = require("../config/db");

exports.getProfile = (req, res) => {
  db.query("SELECT * FROM users WHERE id = ?", [req.userId], (err, results) => {
    if (err || results.length === 0) {
      res.status(404).send({ status: "error", message: "User not found" });
      return;
    }

    const user = results[0];
    res.status(200).send({
      status: "success",
      data: {
        name: user.name,
        photo: user.photo,
        education: JSON.parse(user.education || "[]"),
        experience: JSON.parse(user.experience || "[]"),
      },
    });
  });
};
