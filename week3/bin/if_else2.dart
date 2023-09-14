void main() {
  var openHours = 8;
  var closedHours = 21;
  var now = 17;
// if (now > openHours && now < closedHours) {
// print("Hello, we're open");
// } else {
// print("Sorry, we've closed");
// }

// condition ? true expression : false expression
  var shopStatus =
      now > openHours ? "Hello, we're open" : "Sorry, we've closed";

  print(shopStatus);
}
