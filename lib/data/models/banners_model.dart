class BannersModel{
 final int id;
  final String image;

  BannersModel({required this.id, required this.image});

factory  BannersModel.fromJson(dynamic json,int index){
  return BannersModel(id:json['data'][index]['id'] ,image:json['data'][index]['image']);
}
}







