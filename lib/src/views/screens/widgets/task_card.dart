import 'package:firebase_task_manager/core/consts/styles/app_style.dart';
import 'package:firebase_task_manager/core/routes/app_route_constants.dart';
import 'package:firebase_task_manager/src/controllers/database_controllers/database_controller.dart';
import 'package:firebase_task_manager/src/models/task_model/task_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class TaskCard extends StatelessWidget {
  TaskModel? e;
  TaskCard({super.key, this.e});

  final dbController = Get.find<DataBaseController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pushNamed(AppRouteConsts.taskDets,params: {
        'id': "${e!.id}"
      }),
      child: Container(
        color: Colors.amber,
        width: double.infinity,
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    e!.title.toString(),
                    style: ThemeText.heading3,
                  ),
                  GestureDetector(
                      onTap: () => dbController.deleteFromDb(e),
                      child: Icon(Icons.delete_outline_rounded))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text(e!.desc.toString())),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Will be Reminded on : ${e!.remdingTime!.split(" ")[0]}",
                    style: ThemeText.boldSmText,
                  ),
                  Text(
                    "Status : ${e!.status}",
                    style: ThemeText.boldSmText,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
