
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oktoast/oktoast.dart';
import 'core/utils/navigationService.dart';


import 'domain/repositories/weather/repo.dart';
import 'presentation/bloc/dashboard/bloc.dart';
import 'presentation/bloc/weather/bloc.dart';
import 'routes/appRoutes.dart';
import 'theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  runApp(const MyApp());
}

/// Main App
class MyApp extends StatelessWidget {
  /// constructor
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(create: (context)=>DashboardBloc()),
                BlocProvider(create: (context)=>WeatherBloc(WeatherRepository.instance))
              ],
              child: MaterialApp(
                navigatorKey: NavigatorService.navigatorKey,
                debugShowCheckedModeBanner: false,
                theme: theme(false),
                themeMode: ThemeMode.light,
                onGenerateRoute: AppRoutes.generateRoute,
                initialRoute: AppRoutes.initialRoute,
              ),
            );
          }),
    );
  }
}
