import '../utils/barrel_export.dart';

class TaskController extends GetxController {

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  var taskList = <Task>[].obs;

  Future<int> addTask({Task? task}) async{
    return await DBHelper.insert(task!);
  }

  //get all the data from table
  void getTasks() async {
      List<Map<String,dynamic>> tasks = await DBHelper.query();
      print("tasks $tasks");
      taskList.assignAll(tasks.map((data) => Task.fromJson(data)).toList());
  }

  void delete(Task task) {
    DBHelper.delete(task);
    getTasks();
  }

  void markTaskCompleted(int id) async{
    await DBHelper.update(id);
    getTasks();
  }
}