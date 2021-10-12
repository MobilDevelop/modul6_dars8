import 'dart:convert';

import 'package:http/http.dart';
import 'package:network_req/model/createmodel.dart';
import 'package:network_req/model/emplist_model.dart';
import 'package:network_req/model/empone_model.dart';
import 'package:network_req/model/user_model.dart';

class Network {
  static String Base = "dummy.restapiexample.com";

  static String Get = "/api/v1/employees";

  static String GetId = "/api/v1/employee/"; // id

  static String Post = "/api/v1/create";

  static String Put = "/api/v1/update/"; // id

  static String Delete = "/api/v1/delete/"; // id

  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };

  static Future<String> GET(String api, Map<String, String> params) async {
    try {
      var uri = Uri.https(Base, api);
      var response = await get(uri, headers: headers);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return '';
      }
    } catch (e) {
      print(e);
      return "";
    }
  }

  static Future<String> POST(String api, Map<String, String> params) async {
    var uri = Uri.http(Base, api);
    var response = await post(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }

    return "";
  }

  static Future<String> PUT(String api, Map<String, String> params) async {
    var uri = Uri.http(Base, api);
    var response = await put(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return "";
  }

  static Future<String> DEL(String api, Map<String, String> params) async {
    var uri = Uri.http(Base, api, params);
    var response = await delete(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return "";
  }

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = new Map();
    return params;
  }

  static Map<String, String> paramsCreate(User user) {
    Map<String, String> params = new Map();
    params.addAll({
      'name': user.name,
      'salary': user.salary,
      'age': user.age,
    });
    return params;
  }

  static Map<String, String> paramsUpdate(User user) {
    Map<String, String> params = new Map();
    params.addAll({
      'name': user.name,
      'salary': user.salary,
      'age': user.age,
    });
    return params;
  }

  /* Http Parsing */

  /* Http Parsing */

  static EmpList parseEmpList(String body) {
    dynamic json = jsonDecode(body);
    var data = EmpList.fromJson(json);
    return data;
  }

  static EmpOne parseEmpOne(String body) {
    dynamic json = jsonDecode(body);
    var data = EmpOne.fromJson(json);
    return data;
  }

  static CreateModel parseModel(String body) {
    dynamic json = jsonDecode(body);
    var data = CreateModel.fromJson(json);
    return data;
  }
}
