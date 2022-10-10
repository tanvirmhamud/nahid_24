import 'package:clean_api/clean_api.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nahid_24/screens/auth/login_screen.dart';
import 'package:nahid_24/utils/constants/colors.dart';
import 'package:nahid_24/utils/function/navigation.dart';
import 'package:nahid_24/utils/function/navigation_class.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'New_Design/MyLiveClass/myliveclass.dart';
import 'New_Design/Mycourses/mycourses.dart';
import 'New_Design/Scorebord/lavelboard.dart';
import 'New_Design/Scorebord/scorebord.dart';

void main() async {
  
  await Hive.initFlutter();
  final dir = await getApplicationDocumentsDirectory();
  await Hive.openBox("user");
  Hive.init(dir.path);
  CleanApi.instance
      .setup(baseUrl: 'https://application.nahid24.com/api/', showLogs: true);
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var box = Hive.box('user');
    // return MaterialApp(
    //   navigatorKey: navKey,
    //   debugShowCheckedModeBanner: false,
    //   title: 'Nahid24',
    //   theme: ThemeData(
    //     appBarTheme: AppBarTheme(backgroundColor: PColor.containerColor),
    //     primarySwatch: Colors.blue,
    //   ),

    //   // home: NavigationScreen(
    //   //   selectedIndex: 0,
    //   // ),
    // home:
    // box.get('token') == null
    //     ? LogInScreen()
    //     : NavigationScreen(
    //         selectedIndex: 0,
    //       );
    //   // home: MyLiveClassPage(),
    //   // home: ScoreboardPage(),
    // );

    return ScreenUtilInit(
      designSize: const Size(360, 890),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          navigatorKey: navKey,
          debugShowCheckedModeBanner: false,
          title: 'Nahid24',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primarySwatch: Colors.blue,
            // textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: child,
        );
      },
      child: box.get('token') == null
          ? LogInScreen()
          : NavigationScreen(
              selectedIndex: 0,
            ),
    );
  }
}


// var primaryColor = Color(0xf045de9).withOpacity(0.90);