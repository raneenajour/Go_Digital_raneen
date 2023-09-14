class Model{
  String? ImageUrl;
  String? name;
  String? details;
  List<String>? picture;
  Model(Map map){
   ImageUrl=map["ImageUrl"];
   name=map["name"];
   details=map["details"];
   picture = List<String>.from(map["picture"]);
  }
}