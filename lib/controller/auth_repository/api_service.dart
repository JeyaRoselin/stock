import 'dart:convert';
import 'dart:io';


import 'package:dio/dio.dart';


import 'package:path/path.dart'; // for basename()
class ApiService {
  final Dio dio;


  ApiService(this.dio,) {
    // Add an interceptor to log request details
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print('Request Headers: ${options.headers}');
        print('Request Body: ${options.data}');
        return handler.next(options); // Continue with the request
      },
      onResponse: (response, handler) {
        // Handle response
        return handler.next(response); // Continue with the response
      },
      onError: (DioError e, handler) {
        // Handle error
        return handler.next(e); // Continue with the error
      },
    ));
  }

 
  Future<Response> get(String endpoint, Map<String, dynamic> queryParams,) async {
    try {
      final response = await dio.get(endpoint, queryParameters: queryParams);
      return response;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> post(String endpoint, dynamic body, {Map<String, dynamic>? headers, bool isFormData = false}) async {
    try {
    
      Response response;
      if (isFormData) {
        // Post with FormData
        response = await dio.post(
          endpoint,
          data: body as FormData, // Expecting FormData here
          // options: options,
        );
      } else {
        // Post with JSON
        response = await dio.post(
          endpoint,
          data: jsonEncode(body), // Ensure the body is encoded to JSON
          // options: options,
        );
      }
      
      return response;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  FormData mapToFormData(Map<String, dynamic> data) {
    final formData = FormData();
    data.forEach((key, value) {
      if (value is File) {
        // If value is a file, add it to FormData
        formData.files.add(MapEntry(
          key,
          MultipartFile.fromFileSync(value.path, filename: basename(value.path)),
        ));
      } else {
        // Add other fields as text
        formData.fields.add(MapEntry(key, value.toString()));
      }
    });
    return formData;
  }
}
