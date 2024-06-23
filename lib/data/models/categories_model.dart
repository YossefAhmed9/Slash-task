class CategoriesModel{
  final String name;

  CategoriesModel({required this.name});

  factory  CategoriesModel.fromJson(dynamic json,int index){
    return CategoriesModel(name:json['data']['data'][index]['name'] );
  }
}







