import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:user_manager/controllers/auth_controller.dart';
import 'package:user_manager/controllers/timer_controller.dart';
import 'package:user_manager/controllers/user_controller.dart';
import 'package:user_manager/utils/constants.dart';
import 'package:user_manager/views/auth/otp_screen.dart';
import 'package:user_manager/views/home/add_user_screen.dart';
import 'package:user_manager/views/home/home_screen.dart';
import 'views/auth/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: Constants.firebaseApiKey,
      appId: Constants.appId,
      messagingSenderId: Constants.messagingSenderId,
      projectId: Constants.projectId,
    ),
  );
  
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(create: (_) => UserController()),
        ChangeNotifierProvider(create: (_) => TimerProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'User Management',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/home',
        routes: {
          '/': (context) =>  LoginScreen(),
          '/home': (context) =>  const HomeScreen(),
          '/otp-screen': (context) => OtpScreen(verificationId: ''),
          '/add-user':(context) => AddUserScreen()
        },
      ),
    );
  }
}
