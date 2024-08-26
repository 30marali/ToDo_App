import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/firebase_functions.dart';
import 'package:todo_app/task_item.dart';

import '../providers/theme_provider.dart';

class TasksTab extends StatefulWidget {
  TasksTab({super.key});

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        CalendarTimeline(
          initialDate: dateTime,
          firstDate: DateTime.now().subtract(Duration(days: 365)),
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateSelected: (date) {
            dateTime = date;
            setState(() {});
          },
          leftMargin: 20,
          monthColor: themeProvider.mode == ThemeMode.light
              ? Theme.of(context).colorScheme.primary
              : Colors.white,
          dayColor: themeProvider.mode == ThemeMode.light
              ? Colors.blue
              : Colors.white,
          activeDayColor: Colors.white,
          activeBackgroundDayColor: Colors.blue,
          dotColor: Colors.white,
          selectableDayPredicate: (date) => date.day != 27,
          locale: 'en',
        ),
        SizedBox(height: 30),
        Expanded(
          child: StreamBuilder(
            stream: FirebaseFunctions.getTasks(dateTime),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Column(
                  children: [
                    Text("Something went wrong"),
                    ElevatedButton(onPressed: () {}, child: Text("try again"))
                  ],
                );
              }
              var tasks = snapshot.data?.docs.map((doc) => doc.data()).toList();

              if (tasks?.isEmpty ?? true) {
                return Text("No Tasks");
              }
              return ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: 25,
                ),
                itemBuilder: (context, index) {
                  return TaskItem(model: tasks[index]);
                },
                itemCount: tasks!.length,
              );
            },
          ),
        )
      ],
    );
  }
}
