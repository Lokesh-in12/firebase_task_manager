import 'package:firebase_task_manager/src/controllers/auth_controller/auth_controller.dart';
import 'package:firebase_task_manager/src/controllers/database_controllers/database_controller.dart';
import 'package:get/get.dart';

class Injections {
  AuthController authController = Get.put(AuthController());
  DataBaseController _databaseController = Get.put(DataBaseController());
}
