import 'dart:convert';

import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Api
{

  Future<dynamic> get({required String url, @required String? token}) async {
      Map<String, String> headers = {};

      if (token != null) {
        headers.addAll({'Authorization': 'Bearer $token'});
      }
      http.Response response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception(
            'there is a problem with status code ${response.statusCode}');
      }
  }

  Future<dynamic> post({required String url,@required dynamic Body,@required String? token})async{
    Map<String,String> headers={};
    if(token!= null)
      {
        headers.addAll({
          'Autherization' : 'Bearer $token',
        });
      }
    http.Response response=await http.post(Uri.parse(url),body:Body,headers: headers);

    if(response.statusCode==200)
      {
        return jsonDecode(response.body);

      }
    else
      {
        throw Exception("there is a problem with status code ${response.statusCode}");
      }

  }

  Future<dynamic> put({required String Url,@required dynamic Body,@required String? token})async{
    Map<String,String> headers={};
    headers.addAll({
      'Content-Type' : 'application/x-www-form-urlencoded',
    });
    if(token!= null)
    {
      headers.addAll({
        'Authorization' : 'Bearer $token',
      });
    }
    http.Response response=await http.post(Uri.parse(Url),body:Body,headers: headers);

    if(response.statusCode==200)
    {
      return jsonDecode(response.body);

    }
    else
    {
      throw Exception("there is a problem with status code ${response.statusCode}");
    }

  }

}