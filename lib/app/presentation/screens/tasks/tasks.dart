import 'package:flutter/material.dart';
import 'package:task/core/design/atomic/atoms/tap_button/tap_button.dart';
import 'package:task/core/design/atomic/organism/animated_checkbox/animated_checkbox.dart';
import 'package:task/core/design/atomic/template/template_base_with_app_bar.dart';
import 'package:task/core/design/responsive/layout.dart';
import 'package:task/core/services/logger_service.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final BooksNewProvider booksNewProvider = context.watch<BooksNewProvider>();
    final List<Map<String, String>> tasks = List.generate(
      40,
      (int index) => <String, String>{
        'title': 'Task ${index + 1}',
        'subTitle': 'Due date: Today at ${index + 1}pm',
      },
    );

    return TemplateBaseWithAppBar(
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
            child: Row(
              children: <Widget>[
                TapButton( title: 'All Tasks', isSelect: true, onTap: (){ LoggerService.log('Tap All Tasks');}, ),
                TapButton( title: 'Pending', onTap: (){ LoggerService.log('Tap Pending');}),
                TapButton( title: 'Completed', onTap: (){LoggerService.log('Tap Completed'); }),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: tasks.length,
              itemBuilder: (BuildContext context, int index) {
                final Map<String, String> task = tasks[index];
                return AnimatedCheckbox(
                  key: Key('${task['title']}/${task['subTitle']}'),
                  title: task['title']!,
                  subTitle: task['subTitle']!,
                  onChanged: (bool value) {
                    LoggerService.warning('Task ${index + 1} is ${value ? 'completed' : 'pending'}');
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
