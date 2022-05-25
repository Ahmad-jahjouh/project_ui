
class Product{

  late String id;
  late String name;
  late String gender;
  late String price;
  late String description;

  Product();

  Map<String,dynamic> toMap() {
    Map<String,dynamic> map = <String,dynamic>{};


    map['name'] = name;
    map['gender'] = gender;
    map['price'] = price;
    map['description'] = description;

    return map;
  }
}