import 'package:todoo/features/task/data/models/task.dart';

abstract class DatasourceRepository {
  Future<List<Task>> fetchTasks();
  Future<void> addTask(Task task);
  Future<void> deleteTask(Task task);
  Future<void> updateTask(Task task);
  Future<void> toggleTask(Task task);
}
