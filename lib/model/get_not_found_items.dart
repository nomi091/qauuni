class GetNotFound {
  bool? error;
  List<Items>? items;

  GetNotFound({this.error, this.items});

  GetNotFound.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }
}

class Items {
  int? id;
  String? name;
  String? location;
  String? contact;
  String? detail;
  String? image;
  Null? userId;
  String? status;
  String? createdAt;
  String? updatedAt;

  Items(
      {this.id,
      this.name,
      this.location,
      this.contact,
      this.detail,
      this.image,
      this.userId,
      this.status,
      this.createdAt,
      this.updatedAt});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    location = json['location'];
    contact = json['contact'];
    detail = json['detail'];
    image = json['image'];
    userId = json['user_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }


}