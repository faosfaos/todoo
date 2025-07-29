import 'package:todoo/features/task/data/models/task.dart';
import 'package:todoo/features/task/data/repositories/datasource_repository.dart';

class DataSourceRepositoryImpl extends DatasourceRepository {
  List<Map<String, dynamic>> taskMap = List.generate(10, (index) {
    return {
      "id": index,
      "task": "Task - $index",
      "content": "Content - $index",
      "isDone": false,
    };
  });
  @override
  Future<void> addTask(Task entity) async {
    taskMap.add(entity.toMap());
  }

  @override
  Future<void> deleteTask(Task entity) async {
    final index = taskMap.indexWhere((element) => element["id"] == entity.id);
    taskMap.removeAt(index);
  }

  @override
  Future<List<Task>> fetchTasks() async {
    await Future.delayed(Duration(milliseconds: 200));
    return taskMap.map((e) => Task.fromMap(e)).toList();
  }

  @override
  Future<void> toggleTask(Task entity) async {
    final index = taskMap.indexWhere((element) => element["id"] == entity.id);
    taskMap[index]["isDone"] = !entity.isDone;
  }

  @override
  Future<void> updateTask(Task entity) async {
    final index = taskMap.indexWhere((element) => element["id"] == entity.id);
    taskMap[index]["task"] = entity.task;
    taskMap[index]["content"] = entity.content;
  }
}
