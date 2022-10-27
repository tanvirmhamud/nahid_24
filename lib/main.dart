import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nahid_24/screens/auth/login_screen.dart';
import 'package:nahid_24/utils/function/navigation.dart';
import 'package:nahid_24/utils/function/navigation_class.dart';
import 'package:flutter/material.dart';

import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'Provider/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  final dir = await getApplicationDocumentsDirectory();
  await Hive.openBox("user");
  Hive.init(dir.path);

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: ((context) => HomeProvider())),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var box = Hive.box('user');
    return ScreenUtilInit(
      designSize: const Size(360, 890),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          // navigatorKey: navKey,
          debugShowCheckedModeBanner: false,
          title: 'Nahid24',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
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