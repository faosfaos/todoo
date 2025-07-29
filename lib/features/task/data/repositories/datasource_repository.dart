import 'package:todoo/features/task/data/models/task.dart';

abstract class DatasourceRepository {
  Future<List<Task>> fetchTasks();
  Future<void> addTask(Task entity);
  Future<void> deleteTask(Task entity);
  Future<void> updateTask(Task entity);
  Future<void> toggleTask(Task entity);
}
