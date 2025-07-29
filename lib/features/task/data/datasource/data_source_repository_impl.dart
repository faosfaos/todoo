import 'package:todoo/features/task/data/models/task.dart';
import 'package:todoo/features/task/data/repositories/datasource_repository.dart';

typedef FakeSQLTable = List<Map<String, dynamic>>;

class DataSourceRepositoryImpl extends DatasourceRepository {
  FakeSQLTable taskMap = _taskTable(row: 10);
  @override
  Future<void> addTask(Task task) async {
    taskMap.add(task.toMap());
  }

  @override
  Future<void> deleteTask(Task task) async {
    final index = _getIndex(task);
    taskMap.removeAt(index);
  }

  @override
  Future<List<Task>> fetchTasks() async {
    await Future.delayed(Duration(milliseconds: 200));
    return taskMap.map((e) => Task.fromMap(e)).toList();
  }

  @override
  Future<void> toggleTask(Task task) async {
    final index = _getIndex(task);
    taskMap[index]["isDone"] = !task.isDone;
  }

  @override
  Future<void> updateTask(Task task) async {
    final index = _getIndex(task);
    taskMap[index]["task"] = task.task;
    taskMap[index]["content"] = task.content;
  }

  int _getIndex(Task task) {
    return taskMap.indexWhere((element) => element["id"] == task.id);
  }
}

FakeSQLTable _taskTable({required int row}) {
  return List.generate(row, (index) {
    return {
      "id": index,
      "task": "Task - $index",
      "content": "Content - $index",
      "isDone": false,
    };
  });
}
