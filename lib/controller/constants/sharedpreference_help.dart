
import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock/model/response_models/search_symbol_model.dart';

class SharedPreferenceHelper {
static late  SharedPreferences? _sharedPreferences;

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  


    Future<void> saveUserStocks(List<BestMatches> stocks) async {
    List<String> stockList =
        stocks.map((e) => jsonEncode(e.toJson())).toList();

    await _sharedPreferences?.setStringList(
        PrefKeys.userStocks, stockList);
  }

   List<BestMatches> getUserStocks() {
    List<String>? stockList =
        _sharedPreferences?.getStringList(PrefKeys.userStocks);

    if (stockList != null && stockList.isNotEmpty) {
      return stockList
          .map((e) =>
              BestMatches.fromJson(jsonDecode(e)))
          .toList();
    }
    return [];
  }
  

 
}

mixin PrefKeys {
  static const String userStocks = "user_stocks"; 
  
  
}