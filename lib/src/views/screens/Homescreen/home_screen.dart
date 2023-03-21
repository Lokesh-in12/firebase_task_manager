import 'package:firebase_task_manager/src/controllers/database_controllers/database_controller.dart';
import 'package:firebase_task_manager/src/models/task_model/task_model.dart';
import 'package:firebase_task_manager/src/views/screens/widgets/dilaogue_box.dart';
import 'package:firebase_task_manager/src/views/screens/widgets/task_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final dbController = Get.find<DataBaseController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbController.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (dbController.Tasks.length > 0) {
        return Scaffold(
          appBar: AppBar(title: const Text("Firebase Task Manager")),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: dbController.Tasks.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        TaskCard(e: dbController.Tasks[index]),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    );
                  },
                ),
              ),
              FloatingActionButton(
                onPressed: () => displayCreateTaskPopUp(context, dbController),
                child: const Icon(CupertinoIcons.add),
              ),
            ],
          ),
        );
      } else if (dbController.Tasks.length == 0) {
        return Scaffold(
          appBar: AppBar(title: const Text("Firebase Task Manager")),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Center(
                child: Text("No tasks to show"),
              ),
              FloatingActionButton(
                onPressed: () => displayCreateTaskPopUp(context, dbController),
                child: const Icon(CupertinoIcons.add),
              ),
            ],
          ),
        );
      }
      return Scaffold(
        body: Center(
          child: Text("Some error occured"),
        ),
      );
    });
  }
}
