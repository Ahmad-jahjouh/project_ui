
class Favorite{

  late String id;
  // late String name;
  // late String gender;
  // late String price;

  Favorite();

  Map<String,dynamic> toMap() {
    Map<String,dynamic> map = <String,dynamic>{};

    map['id'] = id;
    // map['name'] = name;
    // map['gender'] = gender;
    // map['price'] = price;

    return map;
  }
}