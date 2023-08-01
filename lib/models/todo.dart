import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];

  // reference our box
  final _todoBox = Hive.box('todoBox');

  // run this method if this is the 1st time ever opening this app
  void createInitialData() {
    toDoList = [
      ["Make Tutorial", false],
      ["Do Exercise", false],
    ];
  }

  // load the data from database
  void loadData() {
    toDoList = _todoBox.get("TODOLIST");
  }

  // update the database
  void updateDataBase() {
    _todoBox.put("TODOLIST", toDoList);
  }
}