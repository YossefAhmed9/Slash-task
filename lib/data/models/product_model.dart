class ProductModel {
  String name;
  String image;
  int price;

  ProductModel({required this.name, required this.price, required this.image});

  factory ProductModel.fromJson(dynamic json, int index) {
    return ProductModel(
        name: json['data']['data'][index]['name'],
        price: json['data']['data'][index]['price'],
    image: json['data']['data'][index]['images'][0],
    );
  }
}
