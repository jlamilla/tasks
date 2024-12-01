
import 'dart:async';

import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:task/app/data/models/task/task.dart';
import 'package:task/app/domain/use_cases/task/delete_task_by_id_use_case.dart';
import 'package:task/app/domain/use_cases/task/get_tasks_use_case.dart';
import 'package:task/app/domain/use_cases/task/save_task_by_id_use_case.dart';
import 'package:task/app/domain/use_cases/use_case.dart';
import 'package:task/core/config/di/dependencies/providers/provider_imports.dart';
import 'package:task/core/config/error/failure.dart';
import 'package:task/core/design/atomic/foundations/color_fundation.dart';
import 'package:task/core/design/atomic/molecules/modal_create_task/modal_create_task.dart';
import 'package:task/core/design/atomic/molecules/modal_create_task/modal_create_task_provider.dart';
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

  String titleAppbar = '';
  bool isSelectAll = true;
  bool isSelectPending = false;
  bool isSelectFinalized = false;
  List<Task> tasks = <Task>[];
  List<Task> tasksFilter = <Task>[];

  void onTapAll() {
    titleAppbar = 'All tasks';
    tasksFilter = tasks;
    isSelectAll = true;
    isSelectPending = false;
    isSelectFinalized = false;
    notifyListeners();
  }

  void onTapPending() {
    titleAppbar = 'Pending';
    tasksFilter = tasks.where((Task e) => !e.finalized).toList();
    isSelectPending = true;
    isSelectAll = false;
    isSelectFinalized = false;
    notifyListeners();
  }

  void onTapFinalized() {
    titleAppbar = 'Completed';
    tasksFilter = tasks.where((Task e) => e.finalized).toList();
    isSelectFinalized = true;
    isSelectAll = false;
    isSelectPending = false;
    notifyListeners();
  }

  void validateListView() {
    if (isSelectFinalized) {
      tasksFilter = tasks.where((Task e) => e.finalized).toList();
    } else if (isSelectPending) {
      tasksFilter = tasks.where((Task e) => !e.finalized).toList();
    } else {
      tasksFilter = tasks;
    }
  }

  Future<void> getTasks() async {
    final Either<Failure, List<Task>> result = await _getTasksUseCase.call(NoParams());
    result.fold(
      (Failure l) {
        LoggerService.error('${l.message}');
      },
      (List<Task> r) {
        tasks.clear();
        tasks = r;
        validateListView();
        notifyListeners();
      },
    );
  }

  Future<void> _saveTaskById(Task task) async {
    final Either<Failure, bool> result = await _saveTaskByIdUseCase.call(task);
    result.fold(
      (Failure l) {
        LoggerService.error('${l.message}');
      },
      (bool r) {
        getTasks();
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
        getTasks();
        notifyListeners();
      },
    );
  }

  Future<void> updateTaskStatus(Task value) async {
    await _saveTaskById(value.copyWith(finalized: !value.finalized));
  }

  Future<void> createTaskModal(BuildContext context) async {
    await showModalBottomSheet<void>(
      isScrollControlled: true,
      backgroundColor: ColorFoundation.background.white,
      context: context,
      builder: (BuildContext context) {
        return ChangeNotifierProvider<ModalCreateTaskProvider>(
          create: (_) => ModalCreateTaskProvider(),
          child: ModalCreateTask(
            onSave: (Task value) async {
              await _saveTaskById(value);
            },
          ),
        );
      },
    );
  }

}
