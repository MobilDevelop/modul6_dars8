
import 'emp_model.dart';

class CreateModel {
  String status;
  String id;
  Employee data;

  CreateModel.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        id = json['message'],
        data = Employee.fromJson(json['data']);

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": id,
    "data": data.toJson(),
  };

}