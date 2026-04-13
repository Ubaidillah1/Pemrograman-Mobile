(int, int) tukar((int, int) record) {
var (a, b) = record;
return(b, a);
}

void main() {
  var pasangan = (10, 20);

  print("Sebelum tukar: $pasangan");

  var hasil = tukar(pasangan);

  print("Sesudah tukar: $hasil");

  (String, int) mahasiswa = ('Ubaidillah Ulil Absor A', 244107060158);

  print(mahasiswa);
  print(mahasiswa.$1);
  print(mahasiswa.$2);

  var mahasiswa2 = ('Ubaidillah Ulil Absor A', a: 2, b: true, 244107060158);
  print(mahasiswa2.$1);
  print(mahasiswa2.a);
  print(mahasiswa2.b);
  print(mahasiswa2.$2);
}