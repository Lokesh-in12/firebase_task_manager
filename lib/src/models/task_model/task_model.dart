import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class TaskModel {
  String? id;
  String? desc;
  String? remdingTime;
  String? status;
  String? title;

  TaskModel({this.desc, this.remdingTime, this.status, this.title});

  TaskModel.fromJson(QueryDocumentSnapshot<Map<String, dynamic>> json) {
    debugPrint(json.id.toString());
    id = json.id.toString();
    desc = json['desc'];
    remdingTime = json['remdingTime'].toString();
    status = json['status'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['desc'] = this.desc;
    data['remdingTime'] = this.remdingTime;
    data['status'] = "pending";
    data['title'] = this.title;
    return data;
  }

  // Map<String, dynamic> tojson() {
  //   return {
  //     "title": title,
  //     "desc": desc,
  //     "remdingTime": remdingTime,
  //     "status": "pending"
  //   };
  // }
}
