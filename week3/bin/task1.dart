void main() {
  // Variabel untuk jumlah botol minyak goreng
  int jumlahBotolMinyak = 1;

  // Variabel untuk jumlah telur
  int jumlahTelur = 0;

  // Cek apakah ada telur
  bool adaTelur = true; // Ubah menjadi false jika tidak ada telur

  // Jika ada telur, ambil 6 telur
  if (adaTelur) {
    jumlahTelur = 6;
  }

  // Menampilkan pesan hasil
  print('Beli $jumlahBotolMinyak botol minyak goreng.');
  print('Ambil $jumlahTelur telur.');
}