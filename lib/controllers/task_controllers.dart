// import 'package:calendar/db/db_helper.dart';
// import 'package:calendar/models/task.dart';
// import 'package:get/get.dart';

// class TaskController extends GetxController {
//   @override
//   void onReady() {
//     super.onReady();
//   }

//   var taskList = <Task>[].obs;

//   Future<int> addTask({Task? task}) async {
//     //异步编程 await 一定要用
//     return await DBHelper.insert(task);
//   }

//   void getTasks() async {
//     List<Map<String, dynamic>> tasks = await DBHelper.query();
//     taskList.assignAll(tasks.map((data) => new Task.fromJson(data)).toList());
//   }

//   void delete(Task task) async {
//     DBHelper.delete(task);
//     getTasks();
//   }

//   void markTaskCompleted(int id) async {
//     await DBHelper.update(id);
//     getTasks();
//   }
// }
