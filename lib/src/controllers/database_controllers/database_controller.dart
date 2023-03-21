import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_task_manager/src/models/task_model/task_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataBaseController extends GetxController {
  late final Tasks = [].obs;
  final cloudDbRef = FirebaseFirestore.instance;

  void getData() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await cloudDbRef.collection('Tasks').get();
    List data = snapshot.docs.map((e) => TaskModel.fromJson(e)).toList();
    Tasks.value = data;
    print("the data from db =>>> ${snapshot.docs.map((e) => e.id)}");
  }

  //delete from db
  void deleteFromDb(TaskModel? e) async {
    print("inside from deleteFromDb =>>> ${e!.id}");
    Tasks.removeWhere((element) => element.id == e.id);
    await cloudDbRef.collection('Tasks').doc(e.id).delete();
    print("deleted");
  }

  //add data to firestore
  Future<bool> addToDb(TaskModel data, BuildContext context) async {
    try {
      if (kDebugMode) {
        print("hey");
      }
      await cloudDbRef.collection('Tasks').add(data.toJson());
      return true;
    } catch (e) {
      if (kDebugMode) {
        print("err in addToDb() =>> $e");
      }
      return false;
    }
  }
}
