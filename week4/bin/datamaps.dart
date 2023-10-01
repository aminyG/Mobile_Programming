void main(List<String> args) {
  //Key: Value
  var gifts = {
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 1,
    'name': 'Aminy Ghaisan',
    'nim': 2141720163
  };
  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 2,
    0: 'Aminy Ghaisan',
    1: 2141720163
  };

  var mhs1 = Map<String, String>();
  mhs1['first'] = 'partridge';
  mhs1['second'] = 'turtledoves';
  mhs1['fifth'] = 'golden rings';
  mhs1['name'] = 'Aminy Ghaisan';
  mhs1['nim'] = '2141720163';

  var mhs2 = Map<int, String>();
  mhs2[2] = 'helium';
  mhs2[10] = 'neon';
  mhs2[18] = 'argon';
  mhs2[0] = 'Aminy Ghaisan';
  mhs2[1] = '2141720163';

  print(mhs1);
  print(mhs2);
  print(gifts);
  print(nobleGases);
}
