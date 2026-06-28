import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/data/todoDatabase.dart';
import 'package:todo_app/widgets/dialog_box.dart';
import 'package:todo_app/widgets/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  final _box = Hive.box('todoBox');

  Tododatabase _db = Tododatabase();

  @override
  void initState() {
    if (_box.get('TODOLIST') == null) {
      _db.createInitData();
    } else {
      _db.loadData();
    }
    super.initState();
  }

  void checkboxChanged(bool? value, int index) {
    setState(() {
      _db.tasks[index][1] = !_db.tasks[index][1];
    });
    _db.updateData();
  }

  void createNewTAsk() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: onSave,
          oncancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void onSave() {
    setState(() {
      _db.tasks.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    _db.updateData();
  }

  void deleteTask(int index) {
    setState(() {
      _db.tasks.removeAt(index);
    });
    _db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Todo App",
          style: TextStyle(fontSize: 22, color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: _db.tasks.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskTitle: _db.tasks[index][0],
            taskCompleted: _db.tasks[index][1],
            onChanged: (value) => checkboxChanged(value, index),
            onDelete: (context) => deleteTask(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: createNewTAsk,
        child: Icon(Icons.add, size: 30, color: Colors.white),
      ),
    );
  }
}
