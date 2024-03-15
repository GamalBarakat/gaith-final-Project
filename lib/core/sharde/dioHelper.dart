
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper{

  static late Dio dio;
  static init()
  {
    dio=Dio(BaseOptions(baseUrl:'https://student.valuxapps.com/api/',
    receiveDataWhenStatusError: true,

    ));
  }

  static Future<Response>getData({required String url,String? token,Map<String,dynamic>? query})async
  {
    dio.options.headers={
      'Content-Type':'application/json',
      'lang':'ar',
       'Authorization':token

    };
   return await dio.get(url,queryParameters: query);
  }

  static Future<Response>postData({required String url, Map<String,dynamic>? data, String?token })async
  {

    return   dio.post(url,data: data);
  }

  static Future<Response>putData({required String url,Map<String,dynamic> ?data,String?token })async
  {

    return   dio.put(url,data: data);
  }

}