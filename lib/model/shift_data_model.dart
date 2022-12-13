class ShiftData {
  bool? error;
  List<BusShift>? data;

  ShiftData({this.error, this.data});

  ShiftData.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    if (json['data'] != null) {
      data = <BusShift>[];
      json['data'].forEach((v) {
        data!.add( BusShift.fromJson(v));
      });
    }
  }

}

class BusShift {
  int? id;
  String? name;
  String? icon;
  String? createdAt;
  String? updatedAt;

  BusShift({this.id, this.name, this.icon, this.createdAt, this.updatedAt});

  BusShift.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

}
