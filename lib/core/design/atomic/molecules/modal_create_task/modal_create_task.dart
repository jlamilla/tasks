import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/app/data/models/task/task.dart';
import 'package:task/core/design/atomic/foundations/color_fundation.dart';
import 'package:task/core/design/atomic/foundations/font_fundation.dart';
import 'package:task/core/design/atomic/molecules/modal_create_task/modal_create_task_provider.dart';
import 'package:task/core/design/responsive/layout.dart';
import 'package:task/core/design/utils/format_date.dart';

class ModalCreateTask extends StatefulWidget {
  const ModalCreateTask({super.key, required this.onSave});

  final void Function(Task value) onSave;

  @override
  _ModalCreateTaskState createState() => _ModalCreateTaskState();
}

class _ModalCreateTaskState extends State<ModalCreateTask> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ModalCreateTaskProvider modalCreateTaskProvider = context.watch<ModalCreateTaskProvider>();

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: context.layout.width * 0.018,
        right: context.layout.width * 0.018,
        top: context.layout.width * 0.018,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  focusNode: _focusNode,
                  onChanged: modalCreateTaskProvider.onChangedTitle,
                  decoration: const InputDecoration(
                    labelText: 'Add a task title',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(width: context.layout.width * 0.01),
              ElevatedButton(
                onPressed: modalCreateTaskProvider.titleTask.isEmpty ? null :  () {
                  widget.onSave(modalCreateTaskProvider.onSaveTasks(context));
                },
                child: Text(
                  'Save',
                  style: modalCreateTaskProvider.titleTask.isEmpty 
                    ? FontFoundation.paragraph.medium14Blue2 
                    : FontFoundation.paragraph.medium14Black,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: context.layout.height * 0.004),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.watch_later_outlined),
                    onPressed: () async {
                      await modalCreateTaskProvider.modalCalendar(context);
                    },
                  ),
                  Visibility(
                    visible: modalCreateTaskProvider.selectedDate != null,
                    child: Chip(
                      backgroundColor: ColorFoundation.background.white,
                      label: Text(FormatDate.formatDayAndMonth(modalCreateTaskProvider.selectedDate)),
                      deleteIcon: const Icon(Icons.close),
                      onDeleted: modalCreateTaskProvider.onDeletedSelectedDate,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
