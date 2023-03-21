import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_task_manager/core/consts/injections/injections.dart';
import 'package:firebase_task_manager/core/routes/app_route_config.dart';
import 'package:firebase_task_manager/firebase_options.dart';
import 'package:firebase_task_manager/src/controllers/auth_controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Injections();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    // print(
    // "the isLogged from authCon after build is =>> ${authController.isLoggedIn.value}");
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig:
          MyAppRouterConfig.returnRouter(authController.isLoggedIn.value),
    );
  }
}
