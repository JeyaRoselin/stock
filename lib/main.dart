import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stock/controller/auth_repository/api_service.dart';
import 'package:stock/controller/auth_repository/auth_repository.dart';
import 'package:stock/controller/constants/constant.dart';
import 'package:stock/controller/constants/my_observer.dart';
import 'package:stock/controller/constants/sharedpreference_help.dart';
import 'package:stock/controller/cubits/esg_cubit.dart';
import 'package:stock/controller/cubits/historical_data_cubit.dart';
import 'package:stock/controller/cubits/search_symbol_cubit.dart';
import 'package:stock/controller/router/app_router.dart';
Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();

  final pref = SharedPreferenceHelper();
  await pref.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
 final _appRouter = AppRouter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      final Dio dio = Dio(BaseOptions(
      // baseUrl: ApiConstant.baseUrl,
      responseType: ResponseType.json,
      receiveDataWhenStatusError: true,
      validateStatus: (_) => true,
      headers: {
        "Accept": "application/json",
      },
      connectTimeout: const Duration(seconds: 100),
      receiveTimeout: const Duration(seconds: 100),
    ));

    // Add interceptors if needed
    // dio.interceptors.add(LoggerInterceptor());

    // Create ApiService instance
    final ApiService apiService = ApiService(dio);

    // Create AuthRepository instance
    final AuthRepository authRepository = AuthRepository(apiService);

    // Create SiteSetting
   
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepository(apiService),
        ),
        
        // RepositoryProvider<SiteSettingsRepository>(
        //   create: (context) => SiteSettingsRepository(),
        // ),
        ],
        child:MultiBlocProvider(
        providers: [
          BlocProvider<SearchSymbolCubit>(
            create: (repoContext) => SearchSymbolCubit(authRepository:AuthRepository(apiService))),
        
         BlocProvider<EsgCubit>(
            create: (repoContext) => EsgCubit(authRepository:AuthRepository(apiService))),
         BlocProvider<HistoricalDataCubit>(
            create: (repoContext) => HistoricalDataCubit(authRepository:AuthRepository(apiService))),
        
          ],

   child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: MaterialApp.router(
                routerConfig: _appRouter.config(
                  navigatorObservers: () => [MyObserver()],
                ),
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(seedColor: whiteColor),
                  useMaterial3: true,
                   unselectedWidgetColor: appColor,
                  appBarTheme: AppBarTheme(
                    iconTheme: IconThemeData(
                      color: appColor,
                    ),
                  ),
                  fontFamily: 'Poppins',
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}