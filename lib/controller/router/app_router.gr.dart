// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:stock/model/response_models/search_symbol_model.dart' as _i7;
import 'package:stock/view/screens/add_stock.dart' as _i1;
import 'package:stock/view/screens/dashboard_screen.dart' as _i2;
import 'package:stock/view/screens/search_symbol_screen.dart' as _i3;
import 'package:stock/view/screens/splash_screen.dart' as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    AddStockScreen.name: (routeData) {
      final args = routeData.argsAs<AddStockScreenArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AddStockScreen(
          key: args.key,
          stock: args.stock,
        ),
      );
    },
    DashboardScreen.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.DashboardScreen(),
      );
    },
    SearchSymbolScreen.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SearchSymbolScreen(),
      );
    },
    SplashScreen.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddStockScreen]
class AddStockScreen extends _i5.PageRouteInfo<AddStockScreenArgs> {
  AddStockScreen({
    _i6.Key? key,
    required _i7.BestMatches stock,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          AddStockScreen.name,
          args: AddStockScreenArgs(
            key: key,
            stock: stock,
          ),
          initialChildren: children,
        );

  static const String name = 'AddStockScreen';

  static const _i5.PageInfo<AddStockScreenArgs> page =
      _i5.PageInfo<AddStockScreenArgs>(name);
}

class AddStockScreenArgs {
  const AddStockScreenArgs({
    this.key,
    required this.stock,
  });

  final _i6.Key? key;

  final _i7.BestMatches stock;

  @override
  String toString() {
    return 'AddStockScreenArgs{key: $key, stock: $stock}';
  }
}

/// generated route for
/// [_i2.DashboardScreen]
class DashboardScreen extends _i5.PageRouteInfo<void> {
  const DashboardScreen({List<_i5.PageRouteInfo>? children})
      : super(
          DashboardScreen.name,
          initialChildren: children,
        );

  static const String name = 'DashboardScreen';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SearchSymbolScreen]
class SearchSymbolScreen extends _i5.PageRouteInfo<void> {
  const SearchSymbolScreen({List<_i5.PageRouteInfo>? children})
      : super(
          SearchSymbolScreen.name,
          initialChildren: children,
        );

  static const String name = 'SearchSymbolScreen';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SplashScreen]
class SplashScreen extends _i5.PageRouteInfo<void> {
  const SplashScreen({List<_i5.PageRouteInfo>? children})
      : super(
          SplashScreen.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreen';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
