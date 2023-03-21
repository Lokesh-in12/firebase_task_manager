import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  RxBool isLoggedIn = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    runAuth();
    getAuth();
  }

  void runAuth() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    print("bool setted as true");
  }

  void getAuth() async {
    final prefs = await SharedPreferences.getInstance();
    bool? res = prefs.getBool('isLoggedIn');
    print("res from getAuth 15=> $res");
    isLoggedIn.value = res!;
  }
}
