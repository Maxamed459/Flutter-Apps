import 'package:hive_flutter/hive_flutter.dart';

class Tododatabase {
  List tasks = [];

  final _box = Hive.box('todoBox');

  // init the data for the first time ever openning this app
  void createInitData() {
    tasks = [
      ["Make Dinner", false],
      ["Create new app", false],
    ];
  }

  // load data from the databse
  void loadData() {
    tasks = _box.get('TODOLIST');
  }

  // update the database
  void updateData() {
    _box.put("TODOLIST", tasks);
  }
}
