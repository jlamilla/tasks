import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/app/data/models/task/task.dart';
import 'package:task/app/presentation/screens/tasks/tasks_provider.dart';
import 'package:task/core/design/atomic/atoms/tap_button/tap_button.dart';
import 'package:task/core/design/atomic/foundations/color_fundation.dart';
import 'package:task/core/design/atomic/organism/animated_checkbox/animated_checkbox.dart';
import 'package:task/core/design/atomic/template/template_base_with_app_bar.dart';
import 'package:task/core/design/responsive/layout.dart';
import 'package:task/core/design/utils/format_date.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TasksProvider tasksProvider = context.watch<TasksProvider>();

    return TemplateBaseWithAppBar(
      onPressedFloatingActionButton: () async {
        await tasksProvider.createTaskModal(context);
      },
      titleAppbar: tasksProvider.titleAppbar,
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              bottom: context.layout.value<double>(
                xs: context.layout.height * 0.02,
                sm: context.layout.height * 0.02,
                md: context.layout.height * 0.01,
                lg: context.layout.height * 0.01,
              ),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: context.layout.height * 0.002, 
                horizontal: context.layout.width * 0.015,
              ),
              margin: EdgeInsets.symmetric(horizontal: context.layout.width * 0.015),
              decoration: BoxDecoration(
                color: ColorFoundation.background.white3,
                borderRadius: BorderRadius.circular(22),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: TapButton( 
                      title: 'All Tasks', 
                      isSelect: tasksProvider.isSelectAll, 
                      onTap: tasksProvider.onTapAll, 
                    ),
                  ),
                  const Spacer( flex: 1),
                  Expanded(
                    flex: 5,
                    child: TapButton( 
                      title: 'Pending', 
                      isSelect: tasksProvider.isSelectPending, 
                      onTap: tasksProvider.onTapPending
                    ),
                  ),
                  const Spacer( flex: 1),
                  Expanded(
                    flex: 6,
                    child: TapButton( 
                      title: 'Completed', 
                      isSelect: tasksProvider.isSelectFinalized, 
                      onTap: tasksProvider.onTapFinalized,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: tasksProvider.tasksFilter.length,
              itemBuilder: (BuildContext context, int index) {
                final Task task = tasksProvider.tasksFilter[index];
                return AnimatedCheckbox(
                  key: Key(task.id),
                  title: task.title,
                  subTitle: FormatDate.formatDayAndMonth(task.taskDate),
                  initialValue: task.finalized,
                  onDeleted: () async {
                    await tasksProvider.deleteTaskById(task);
                  },
                  onChanged: (bool value) async {
                    await tasksProvider.updateTaskStatus(task);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
