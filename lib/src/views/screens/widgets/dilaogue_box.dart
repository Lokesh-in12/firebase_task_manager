import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_task_manager/core/consts/styles/app_style.dart';
import 'package:firebase_task_manager/core/themes/themes.dart';
import 'package:firebase_task_manager/core/utils/helpers/date_time_picker.dart';
import 'package:firebase_task_manager/src/controllers/database_controllers/database_controller.dart';
import 'package:firebase_task_manager/src/models/task_model/task_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<void> displayCreateTaskPopUp(
    BuildContext ctx, DataBaseController dbController) async {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descController = TextEditingController();

  DateTime? dateTime;

  showDialog(
    context: ctx,
    builder: (context) {
      return AlertDialog(
        title: const Text("Create a new Task!"),
        content: SizedBox(
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(hintText: "Task Title"),
              ),
              // ignore: prefer_const_constructors
              TextField(
                controller: _descController,
                decoration: const InputDecoration(hintText: "Task Desc.."),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  dateTime = await showDateTimePicker(context);
                  print(dateTime!.toLocal());
                },
                child: Row(
                  children: const [
                    Text(
                      "Time to remind!",
                      style: ThemeText.smallBlackTxt,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(CupertinoIcons.time)
                  ],
                ),
              )
            ],
          ),
        ),
        actions: [
          TextButton(
              onPressed: () => context.pop(), child: const Text("cancel")),
          TextButton(
              onPressed: () async {
                bool done = await dbController.addToDb(
                    TaskModel(
                        title: _titleController.text.trim(),
                        desc: _descController.text.trim(),
                        remdingTime: dateTime.toString()),
                    context);
                done
                    // ignore: use_build_context_synchronously
                    ? ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                          "Successfully created task!",
                          style: ThemeText.snackBarSuccess,
                        ),
                        backgroundColor: ThemeColor.green,
                      ))
                    // ignore: use_build_context_synchronously
                    : ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                          "Successfully created task!",
                          style: ThemeText.snackBarErr,
                        ),
                        backgroundColor: ThemeColor.errorRed,
                      ));

                // ignore: use_build_context_synchronously
                context.pop();
                dbController.getData();
              },
              child: const Text("create")),
        ],
      );
    },
  );
}
