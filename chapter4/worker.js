const { Elm } = require("./elm.js");

const app = Elm.Worker.init();
app.ports.tick.subscribe(count => {
  console.log(count);
});