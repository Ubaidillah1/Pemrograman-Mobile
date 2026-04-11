void main() {
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  print(halogens);

  var names1 = <String>{};
  Set<String> names2 = {};

  names1.add("Ubaidillah Ulil Absor Abdala");
  names1.add("244107060158");

  names2.addAll(names1);

  print(names1);
  print(names2);
}