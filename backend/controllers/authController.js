const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const db = require("../config/db");
const secretKey = "your_secret_key";

exports.signup = (req, res) => {
  const { email, password, name, photo } = req.body;
  const hashedPassword = bcrypt.hashSync(password, 8);

  db.query(
    "INSERT INTO users (email, password, name, photo) VALUES (?, ?, ?, ?)",
    [email, hashedPassword, name, photo],
    (err, results) => {
      if (err) {
        res
          .status(500)
          .send({ status: "error", message: "Error creating user" });
        return;
      }
      const token = jwt.sign({ id: results.insertId }, secretKey, {
        expiresIn: 86400,
      });
      res.status(201).send({ status: "success", token });
    }
  );
};

exports.login = (req, res) => {
  const { email, password } = req.body;

  db.query("SELECT * FROM users WHERE email = ?", [email], (err, results) => {
    if (err || results.length === 0) {
      res.status(400).send({ status: "error", message: "User not found" });
      return;
    }

    const user = results[0];
    const passwordIsValid = bcrypt.compareSync(password, user.password);

    if (!passwordIsValid) {
      res.status(401).send({ status: "error", message: "Invalid password" });
      return;
    }

    const token = jwt.sign({ id: user.id }, secretKey, { expiresIn: 86400 });
    res.status(200).send({ status: "success", token });
  });
};

// API route for password reset
exports.resetpassword = (req, res) => {
  const { email } = req.body;
  db.query("SELECT * FROM users WHERE email = ?", [email], (err, results) => {
    if (err) throw err;
    if (results.length > 0) {
      const token = jwt.sign({ email }, "secret_key", { expiresIn: "1h" });
      const resetLink = `http://your-frontend-url/reset-password?token=${token}`;

      const mailOptions = {
        from: "tashidorji.ovc@rub.edu.bt",
        to: email,
        subject: "Password Reset",
        text: `Click the link to reset your password: ${resetLink}`,
      };

      transporter.sendMail(mailOptions, (error, info) => {
        if (error) {
          res
            .status(500)
            .json({ status: "error", message: "Failed to send email" });
        } else {
          res.json({ status: "success", message: "Password reset email sent" });
        }
      });
    } else {
      res.status(404).json({ status: "error", message: "Email not found" });
    }
  });
};
