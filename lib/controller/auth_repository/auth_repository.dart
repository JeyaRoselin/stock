
import 'package:dio/dio.dart';
import 'package:stock/controller/auth_repository/api_service.dart';
import 'package:stock/controller/constants/api_constants.dart';
import 'package:stock/model/response_models/esg_model.dart';
import 'package:stock/model/response_models/historical_data_model.dart';

import 'package:stock/model/response_models/search_symbol_model.dart';



class AuthRepository {
  final Dio _dio = Dio();
final ApiService apiService;
 
  AuthRepository(this.apiService);
  
//      Future<dynamic> userSearchSymbol(SearchSymbolRequestModel SearchSymbolRequestModel)async{
//  try {
 
//       var response = await apiService.post(ApiConstant.userSearchSymbol,SearchSymbolRequestModel);
//        if (response.statusCode == 200 ) {
//         var responseData = response.data;
//         print('SearchSymbol-----${responseData}');
//         return (true,SearchSymbolModel.fromJson(responseData));
//        }
//        else {
//         // Handle other status codes
//         print('Unexpected status code: ${response.statusCode}');
//         return (false, SearchSymbolModel());
//       }
//     } catch (e,stacktrace) {
//       print('Exception occurred: $e');
//       print('Stacktrace${stacktrace}');
//       return (false, SearchSymbolModel());
//     }
//     } 
      Future<dynamic> userSearchSymbol()async{
 try {
 
      var response = await apiService.get(ApiConstant.userSearchSymbol,{});
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('SearchSymbol-----${responseData}');
        return (true,SearchSymbolModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, SearchSymbolModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, SearchSymbolModel());
    }
    } 
      Future<dynamic> userEsg()async{
 try {
 
      var response = await apiService.post(ApiConstant.userEsg,{});
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('SearchSymbol-----${responseData}');
        return (true,EsgModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, EsgModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, EsgModel());
    }
    } 
         Future<dynamic> userHistoricalData()async{
 try {
 
      var response = await apiService.get(ApiConstant.userHistoricalData,{});
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        print('SearchSymbol-----${responseData}');
        return (true,HistoricalDataModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
        print('Unexpected status code: ${response.statusCode}');
        return (false, HistoricalDataModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, EsgModel());
    }
    } 
    
}