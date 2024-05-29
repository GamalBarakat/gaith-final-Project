
import 'dart:convert';

import 'package:dio/dio.dart';


class DioHelper{

  static late Dio dio;
  static init()
  {
    dio=Dio(BaseOptions(baseUrl:'http://test.tmwenatapp.com/api/',
    receiveDataWhenStatusError: true,
      headers: {
        'Accept': 'application/json',
        'Accept-Language': 'ar',
        'Authorization': 'Bearer 1|hjQFoXjf67YDlpoXwu8WW5lG1CIk6IqF7s1KNSnB'
      }


    ));

  }

  static Future<Response>getData({required String url,Map<String,dynamic>? query})async
  {
    // dio.options.headers={
    //   'Accept': 'application/json',
    //   'Accept-Language': 'ar',
    //   'Authorization': 'Bearer 1|hjQFoXjf67YDlpoXwu8WW5lG1CIk6IqF7s1KNSnB'
    // };
   return await dio.get(url,queryParameters: query);
  }

  static Future<Response>postData({required String url, Map<String,dynamic>? data, String?token })async
  {
    // dio.options.headers={
    //   'Accept': 'application/json',
    //   'Accept-Language': 'ar',
    //   'Authorization':'Bearer 1|hjQFoXjf67YDlpoXwu8WW5lG1CIk6IqF7s1KNSnB'
    //
    //
    // };
    return   dio.post(url,data: data);
  }

  static Future<Response>putData({required String url,Map<String,dynamic> ?data,String?token })async
  {

    return   dio.put(url,data: data);
  }

}