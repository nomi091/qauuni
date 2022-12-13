class BusRouteData {
  bool? error;
  List<Data>? data;

  BusRouteData({this.error, this.data});

  BusRouteData.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add( Data.fromJson(v));
      });
    }
  }

}
class Data {
  int? id;
  String? busNumber;
  String? routeDetails;
  String? stand;
  String? pdfFile;
  String? status;
  String? departure;
  String? shiftId;
  String? createdAt;
  String? updatedAt;
  Shifts? shifts;

  Data(
      {this.id,
      this.busNumber,
      this.routeDetails,
      this.stand,
      this.pdfFile,
      this.status,
      this.departure,
      this.shiftId,
      this.createdAt,
      this.updatedAt,
      this.shifts});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    busNumber = json['bus_number'];
    routeDetails = json['route_details'];
    stand = json['stand'];
    pdfFile = json['pdf_file'];
    status = json['status'];
    departure = json['departure'];
    shiftId = json['shift_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    shifts =
        json['shifts'] != null ?  Shifts.fromJson(json['shifts']) : null;
  }

}

class Shifts {
  int? id;
  String? name;
  String? icon;
  String? createdAt;
  String? updatedAt;

  Shifts({this.id, this.name, this.icon, this.createdAt, this.updatedAt});

  Shifts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }


}