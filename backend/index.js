const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");

const authController = require("./controllers/authController");
const profileController = require("./controllers/profileController");
const authMiddleware = require("./middleware/authMiddleware");

const app = express();
const port = 3000;

app.use(bodyParser.json());
app.use(cors());

app.post("/api/signup", authController.signup);
app.post("/api/login", authController.login);
app.post("/api/resetpassword", authController.resetpassword);

app.get(
  "/api/profile",
  authMiddleware.verifyToken,
  profileController.getProfile
);

// Set up email transporter
const transporter = nodemailer.createTransport({
  service: "gmail",
  auth: {
    user: "tashidorji.ovc@rub.edu.bt",
    pass: "Tashi@1066",
  },
});

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}/`);
});
