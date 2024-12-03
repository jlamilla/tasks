
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task/app/data/models/task/task.dart';
import 'package:task/core/design/atomic/foundations/color_fundation.dart';
import 'package:uuid/uuid.dart';

class ModalCreateTaskProvider extends ChangeNotifier {

  DateTime? selectedDate;
  String titleTask = '';

  Future<void> modalCalendar(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      barrierColor: ColorFoundation.background.black.withOpacity(0.4),
      confirmText: 'Save',
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      selectedDate = pickedDate;
      notifyListeners();
    }
  }

  void onDeletedSelectedDate() {
    selectedDate = null;
    notifyListeners();
  }

  void onChangedTitle(String value) {
    titleTask = value;
    notifyListeners();
  }

  Task onSaveTasks(BuildContext context){
    context.pop();
    return Task(
      id: const Uuid().v4(), 
      title: titleTask, 
      finalized: false, 
      taskDate: selectedDate, 
      createDate: DateTime.now(), 
      updateDate: DateTime.now(),
    );
  }

}
