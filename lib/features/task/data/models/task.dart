// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:todoo/features/task/domain/entities/entity.dart';

class Task {
  final int id;
  final String task;
  final String content;
  final bool isDone;

  Task({
    required this.id,
    required this.task,
    required this.content,
    required this.isDone,
  });

  Task copyWith({int? id, String? task, String? content, bool? isDone}) {
    return Task(
      id: id ?? this.id,
      task: task ?? this.task,
      content: content ?? this.content,
      isDone: isDone ?? this.isDone,
    );
  }

  Map<String, dynamic> toMap() {
    return {"id": id, "task": task, "content": content, "isDone": isDone};
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map["id"],
      task: map["task"],
      content: map["content"],
      isDone: map["isDone"],
    );
  }

  Entity toEntity() {
    return Entity(id: id, task: task, content: content, isDone: isDone);
  }

  factory Task.fromEntity(Entity entity) {
    return Task(
      id: entity.id,
      task: entity.task,
      content: entity.content,
      isDone: entity.isDone,
    );
  }
}
