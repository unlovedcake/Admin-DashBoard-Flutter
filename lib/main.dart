import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_admin_dashboard/controllers/auth-provider.dart';
import 'package:responsive_admin_dashboard/controllers/controller.dart';
import 'package:responsive_admin_dashboard/router/route-generator.dart';
import 'package:responsive_admin_dashboard/router/routes-name.dart';
import 'package:responsive_admin_dashboard/screens/dash_board_screen.dart';
import 'package:responsive_admin_dashboard/screens/login/login.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {



  WidgetsFlutterBinding.ensureInitialized();
   setPathUrlStrategy();

  await Firebase.initializeApp(

    options: const FirebaseOptions(
      apiKey:  "AIzaSyCcbT293eE59ZaTXQEwq2Q0ZxBLS4FKTjU",
      appId: "1:252515632807:web:4fa3e10e797e4f32113d82",
      authDomain: "construction-app-fdb46.firebaseapp.com",
      messagingSenderId: "252515632807",
      projectId: "construction-app-fdb46",
      storageBucket: "construction-app-fdb46.appspot.com", measurementId: "G-PS9PED9GL9"
    ),
  );



  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Controller()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),

      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nittiv',
      debugShowCheckedModeBanner: false,
      //theme: NittivTheme().lightTheme,
      home: Login(),
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: RoutesName.LOGIN_URL,
    );
  }
}

