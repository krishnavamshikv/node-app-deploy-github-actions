const express = require("express");
const app = express();

const PORT = process.env.PORT || 8080;

app.get("/", (req, res) => {
  return res.json({
    message:
      "Hello from nodeJs in the container ,  I am under the sea water , please help me,.. uuu oo",
  });
});

app.listen(PORT, () => {
  console.log(`Server started on ${PORT}..`);
});
