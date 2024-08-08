import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/task_item.dart';


class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarTimeline(
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(Duration(days: 365)),
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateSelected: (date) => print(date),
          leftMargin: 20,
          monthColor: Colors.black,
          dayColor: Colors.blue,
          activeDayColor: Colors.white,
          activeBackgroundDayColor: Colors.blue,
          dotColor: Colors.white,
          selectableDayPredicate: (date) => date.day != 27,
          locale: 'en',
        ),
        SizedBox(height: 24),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              height: 12,
            ),
            itemBuilder: (context, index) {
              return TaskItem();
            },
            itemCount: 30,
          ),
        )
      ],
    );
  }
}