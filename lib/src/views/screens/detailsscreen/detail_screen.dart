import 'package:firebase_task_manager/src/models/task_model/task_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TaskDetailsPage extends StatelessWidget {
  String? id;

  TaskDetailsPage({super.key, @required this.id});

  @override
  Widget build(BuildContext context) {
    print("the id in dets page =>> ${id}");
    return Scaffold(
      appBar: AppBar(
        title: Text(" id : $id "),
      ),
      body: Column(
        children: [
          const SizedBox(
            width: double.infinity,
            height: 20,
            child: Text("Title"),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: const Text(
                "descsflkhsufoh fui sgfgefygysfgs csghhhhfh ffhfyof fuefeifgwi;fugif fuhdu"),
          )
        ],
      ),
    );
  }
}
