class ProductDetails {
  String? id;
  String? name;
  String? price;

  ProductDetails({this.id, this.name, this.price});

  ProductDetails.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['name'] = name;
    data['price'] = price;
    return data;
  }
}
