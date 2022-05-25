class Cart{
  // String? email;

  String? id ;

  Cart();

  Map<String,dynamic> toMap() {
    Map<String,dynamic> map = <String,dynamic>{};

    // map['email'] = email;
    map['id'] = id;

    return map;
  }
}