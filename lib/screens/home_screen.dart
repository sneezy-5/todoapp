import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/todo.dart';
import '../util/dialog_box.dart';
import '../util/dialog_delete_box.dart';
import '../util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference the hive box
  final _myBox = Hive.box('todoBox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    // if this is the 1st time ever openin the app, then create default data
/*    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      // there already exists data
      db.loadData();
    }*/
    if (_myBox.get("TODOLIST") != null) {
      db.loadData();
    }

    super.initState();
  }

  // text controller
   final TextEditingController _controller = TextEditingController();

  // checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  // save new task
  void saveNewTask() {
    if (_controller.text == null || _controller.text.isEmpty) {

    }else {
      setState(() {
        db.toDoList.add([_controller.text, false]);
        _controller.clear();
      });
      Navigator.of(context).pop();
      db.updateDataBase();
    }
  }

  // create a new task
  void createNewTask() {
    _controller.clear();
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }


  // edit a new task
  void editTask(int index) {
    _controller.text = db.toDoList[index][0];
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,//TextEditingController(text: "sdfzfd"), // <-- SEE HERE,
          onSave:(() {

            setState(() {
              db.toDoList[index][0] = _controller.text;

            });
            _controller.clear();
            Navigator.of(context).pop();
            db.updateDataBase();

          }),
          onCancel: () =>{
            _controller.clear(),
            Navigator.of(context).pop()
            },
        );
      },
    );
  }
  // open delete dialog task
  void onpenDeleteTaskDialog(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return DialogDeleteBox(
          onDelete: (() {
        setState(() {
        db.toDoList.removeAt(index);
        });
        Navigator.of(context).pop();
        db.updateDataBase();

        }),//onDeleteTask(index),
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  // delete task
  void onDeleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text('EVERYDAY'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => onpenDeleteTaskDialog(index),
            editFunction: (context) => editTask(index),
          );
        },
      ),
    );
  }
}