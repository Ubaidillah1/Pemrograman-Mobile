void main() {
  var list = [1, 2, 3];
  var list1 = [1, 2, null];
  var list2 = [0, ...list];
  var list3 = [0, ...?list1];
  var nim = ["244107060158"];
  var nim$0 = [...nim];

  bool promoActive = true;
  var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];

  var login = 'Manager';
  var nav2 = ['Home', 'Furniture', 'Plants', if (login == 'Manager') 'Inventory'];

  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  assert(listOfStrings[1] == '#1');

  print(list);
  print(list1);
  print(list2);
  print(list2.length);
  print(list3.length);
  print(nim$0);
  print(nav);
  print(nav2);
  print(listOfStrings);
}