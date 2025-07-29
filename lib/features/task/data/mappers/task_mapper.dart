import 'package:todoo/features/task/data/models/task.dart';
import 'package:todoo/features/task/domain/entities/entity.dart';

abstract class TaskMapper {
  static Entity toEntity(Task task) => task.toEntity();
  static Task toTask(Entity entity) => Task.fromEntity(entity);
  static List<Entity> toEntityList(List<Task> taskList) {
    return taskList.map((e) => e.toEntity()).toList();
  }

  static List<Task> toTaskList(List<Entity> entityList) {
    return entityList.map((e) => Task.fromEntity(e)).toList();
  }
}
