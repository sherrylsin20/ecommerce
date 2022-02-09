import 'dart:convert';

import 'package:ecommerce/model/item.dart';
import 'package:ecommerce/model/user.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class APIServices {
  final String _baseURL = "https://dw.digitalasiasolusindo.com";
  var _globalToken = 'token 1baf1bdd74e71df:9f052addb5c6f3e';
  GetStorage box = GetStorage();

  Future<http.Response> register(email, fullname, password) async {
    var url = _baseURL + '/api/method/test_ecommerce.apis.v1.user.add';
    var headers = {'Authorization': _globalToken};
    var body = jsonEncode({
      'email': email,
      'full_name': fullname,
      'password': password,
    });

    http.Response response =
        await http.post(Uri.parse(url), headers: headers, body: body);
    print(response);
    return response;
  }

  Future<http.Response> auth(email, password) async {
    var url = _baseURL + '/api/method/test_ecommerce.apis.v1.user.auth';
    var headers = {'Authorization': _globalToken};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    http.Response response =
        await http.post(Uri.parse(url), headers: headers, body: body);
    if (response.statusCode == 200) {
      print(await response);
    } else {
      print(response.reasonPhrase);
    }
    return response;
  }

  Future<http.Response> tokenize(email) async {
    var url = _baseURL + '/api/method/test_ecommerce.apis.v1.user.auth';
    var headers = {'Authorization': _globalToken};
    var body = jsonEncode({
      'email': email,
    });
    http.Response response =
        await http.post(Uri.parse(url), headers: headers, body: body);
    print(response);
    return response;
  }

  Future<http.Response> checkSess() async {
    var url = _baseURL + '/api/method/test_ecommerce.apis.v1.user.auth';
    var token = box.read('token');
    http.Response response =
        await http.post(Uri.parse(url), headers: {'Authorization': token});
    print(response);
    return response;
  }

  Future<List<Item>> getItems() async {
    var token = box.read('token');

    List<Item> list = [];
    var url = _baseURL + '/api/method/test_ecommerce.apis.v1.item.get';

    var res = await http.get(Uri.parse(url), headers: {'Authorization': token});

    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      var rest = data["results"] as List;
      print(rest);
      list = rest.map<Item>((json) => Item.fromJson(json)).toList();
    }
    print("List Size: ${list.length}");
    return list;
  }
}
