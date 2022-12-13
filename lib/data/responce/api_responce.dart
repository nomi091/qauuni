import 'package:qauuni/data/responce/status.dart';

class ApiResponce<T> {
  Status? status;
  T? data;
  String? message;
  ApiResponce(this.status, this.message, this.data);
  ApiResponce.lodaing() : status = Status.Lodaing;
  ApiResponce.completed(this.data) : status = Status.Completed;
  ApiResponce.error(this.message) : status = Status.Error;

  @override
  String toString() {
    return 'staus:$status \n message $message \n data $data ';
  }
}
