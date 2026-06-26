import 'package:flutter/material.dart';
import 'package:todo_app/widgets/todo_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
      body: ListView(
        children: [
          SizedBox(height: 20),
          TodoTile(
            taskTitle: "Make dinner",
            taskCompleted: false,
            onChanged: (p0) {},
          ),
          TodoTile(
            taskTitle: "Make Tutorial",
            taskCompleted: true,
            onChanged: (p0) {},
          ),
          TodoTile(
            taskTitle: "Sleep at 10:00PM",
            taskCompleted: false,
            onChanged: (p0) {},
          ),
        ],
      ),
    );
  }
}
