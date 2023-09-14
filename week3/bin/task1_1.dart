int mainCode() {
  // Declare variables
  int oilThatShouldBuy = 1; // Initialize with 1 oil by default
  int eggsThatShouldBuy = 6; // Initialize with 6 eggs by default

  // Check if there are eggs
  bool eggsAvailable = true; // Change this to false if there are no eggs

  // Normal logic: Always buy 1 oil and 6 eggs
  if (eggsAvailable) {
    oilThatShouldBuy = 1;
    eggsThatShouldBuy = 6;
  }

  // ---[ Do not write or change the code below ]---
  print('The result is: $oilThatShouldBuy oil and $eggsThatShouldBuy eggs');
  return oilThatShouldBuy;
}

void main() {
  int result = mainCode();
}
