
import 'package:task/app/data/models/task/task.dart';

abstract class TasksLocalDataSource {
  Future<List<Task>> getTasks();
  Future<bool> saveTaskById(Task request);
  Future<bool> deleteTaskById(Task request);
}
