import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/cubit/mode_cubit/mode_cubit.dart';
import 'package:news_app/cubit/mode_cubit/mode_states.dart';
import 'package:news_app/layout/news_layout.dart';
import 'package:news_app/network/local/cache_helper.dart';
import 'package:news_app/network/remote/dio_helper.dart';
import 'cubit/cubit.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();

  bool isDark = CacheHelper.getModeBoolean(key: 'isDark');

  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool isDark;

  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()..getBusinessData(),
        ),
        BlocProvider(
          create: (BuildContext context) => ModeCubit()
            ..changeMode(
              modeFromShared: isDark,
            ),
        ),
      ],
      child: BlocConsumer<ModeCubit, ModeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                titleSpacing: 20,
                backgroundColor: Colors.white,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: IconThemeData(
                  color: Colors.black,
                  size: 25,
                ),
                elevation: 0,
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  elevation: 20,
                  selectedItemColor: Colors.deepOrange,
                  type: BottomNavigationBarType.fixed),
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.deepOrange,
              textTheme: const TextTheme(
                  bodyText1: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 17,
              )),
              scaffoldBackgroundColor: HexColor('292929'),
              appBarTheme: AppBarTheme(
                titleSpacing: 20,
                backgroundColor: HexColor('292929'),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('292929'),
                  statusBarIconBrightness: Brightness.light,
                ),
                titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: const IconThemeData(
                  color: Colors.white,
                  size: 25,
                ),
                elevation: 0,
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  elevation: 20,
                  backgroundColor: HexColor('3d3d3d'),
                  selectedItemColor: Colors.deepOrange,
                  type: BottomNavigationBarType.fixed,
                  unselectedItemColor: Colors.white),
            ),
            themeMode: ModeCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: const NewsLayout(),
          );
        },
      ),
    );
  }
}
