import 'package:flutter/material.dart';
import 'package:todo_app/widgets/dialog_box.dart';
import 'package:todo_app/widgets/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  List tasks = [
    ["Code 1 hour every day", false],
    ["Sleep at 10:00PM", true],
  ];

  void checkboxChanged(bool? value, int index) {
    setState(() {
      tasks[index][1] = !tasks[index][1];
    });
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
      tasks.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
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
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskTitle: tasks[index][0],
            taskCompleted: tasks[index][1],
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
