import 'package:e_book_okba_store/view/screen/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:device_preview/device_preview.dart';
import 'Config/Themes.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(DevicePreview(builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => GetMaterialApp(
        useInheritedMediaQuery: true, // Set to true
        locale: DevicePreview.locale(context), // Add the locale here
        debugShowCheckedModeBanner: false,
        title: 'E Book Okba',
        theme: darkTheme,
        home: const SplashScreen(),
      ),
      designSize: const Size(1080, 2340),
    );
  }
}


// import 'package:e_book_okba_store/Pages/SplacePage/SplacePage.dart';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'Config/Themes.dart';
// import 'firebase_options.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       builder: (context, child) => GetMaterialApp(
//         useInheritedMediaQuery: true, // Set to true
//         debugShowCheckedModeBanner: false,
//         title: 'E BOOK',
//         theme: darkTheme,
//         home: const SplacePage(),
//       ),
//       designSize: const Size(1080, 2340),
//     );
//   }
// }