
import 'dart:async';

import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:task/app/data/models/task/task.dart';
import 'package:task/app/domain/use_cases/task/delete_task_by_id_use_case.dart';
import 'package:task/app/domain/use_cases/task/get_tasks_use_case.dart';
import 'package:task/app/domain/use_cases/task/save_task_by_id_use_case.dart';
import 'package:task/app/domain/use_cases/use_case.dart';
import 'package:task/core/config/error/failure.dart';
import 'package:task/core/services/logger_service.dart';

class TasksProvider extends ChangeNotifier {

  TasksProvider({
    required GetTasksUseCase getTasksUseCase,
    required SaveTaskByIdUseCase saveTaskByIdUseCase,
    required DeleteTaskByIdUseCase deleteTaskByIdUseCase,
  }): _getTasksUseCase = getTasksUseCase,
      _saveTaskByIdUseCase = saveTaskByIdUseCase,
      _deleteTaskByIdUseCase = deleteTaskByIdUseCase
    {
      getTasks();
    }

  final GetTasksUseCase _getTasksUseCase;
  final SaveTaskByIdUseCase _saveTaskByIdUseCase;
  final DeleteTaskByIdUseCase _deleteTaskByIdUseCase;

  bool isSelectAll = true;
  bool isSelectPending = true;
  bool isSelectFinalized = true;
  List<Task> tasks = <Task>[];

  Future<void> getTasks() async {
    final Either<Failure, List<Task>> result = await _getTasksUseCase.call(NoParams());
    result.fold(
      (Failure l) {
        LoggerService.error('${l.message}');
      },
      (List<Task> r) {
        tasks.clear();
        tasks = r;
        notifyListeners();
      },
    );
  }

  Future<void> saveTaskById(Task task) async {
    final Either<Failure, bool> result = await _saveTaskByIdUseCase.call(task);
    result.fold(
      (Failure l) {
        LoggerService.error('${l.message}');
      },
      (bool r) {
        if (r) {
          tasks.add(task);
        } else {

        }
        notifyListeners();
      },
    );
  }

  Future<void> deleteTaskById(Task task) async {
    final Either<Failure, bool> result = await _deleteTaskByIdUseCase.call(task);
    result.fold(
      (Failure l) {
        LoggerService.error('${l.message}');
      },
      (bool r) {
        if (r) {
          tasks.removeWhere((Task e) => e.id != task.id);
        } else {

        }
        notifyListeners();
      },
    );
  }

}
