import 'dart:io';

void main() {
  int rows = 10; // Jumlah baris

  while (rows >= 1) {
    int cols = 1;
    while (cols <= rows) {
      stdout.write('*');
      cols++;
    }
    stdout.writeln();
    rows--;
  }
}