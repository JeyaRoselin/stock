
import 'package:auto_route/auto_route.dart';
import 'package:stock/controller/router/app_router.gr.dart';

import 'package:stock/controller/router/router_path.dart';










@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
         AutoRoute(
            path: RouterPath.splash_path,
            page: SplashScreen.page,
            initial: true),
         
       
             AutoRoute(
            path: RouterPath.search_symbol_path,
            page: SearchSymbolScreen.page,),
         
       AutoRoute(
            path: RouterPath.dashboard_path,
            page: DashboardScreen.page,),
               AutoRoute(
            path: RouterPath.add_stock_path,
            page: AddStockScreen.page,),
    

         
            ];
            }