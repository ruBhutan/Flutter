const jwt = require("jsonwebtoken");
const secretKey = "your_secret_key";

exports.verifyToken = (req, res, next) => {
  const token = req.headers["authorization"];

  if (!token) {
    return res
      .status(403)
      .send({ status: "error", message: "No token provided" });
  }

  jwt.verify(token.split(" ")[1], secretKey, (err, decoded) => {
    if (err) {
      return res
        .status(500)
        .send({ status: "error", message: "Failed to authenticate token" });
    }
    req.userId = decoded.id;
    next();
  });
};
