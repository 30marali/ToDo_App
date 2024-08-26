import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/my_theme.dart';
import 'package:todo_app/providers/theme_provider.dart';

import 'firebase_functions.dart';
import 'models/task_model.dart';

class AddTaskBottomSheet extends StatefulWidget {
  AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var titleController = TextEditingController();

  var descriptionController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      padding: EdgeInsets.all(18),
      color: themeProvider.mode == ThemeMode.light
          ? Theme.of(context).colorScheme.surface
          : MyThemeData.darkColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              "Add new Task",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: themeProvider.mode == ThemeMode.light
                    ? Theme.of(context).colorScheme.onSurface
                    : MyThemeData.whiteColor,
              ),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              labelText: "Title",

              labelStyle: TextStyle(
                  color: themeProvider.mode == ThemeMode.light
                      ? Theme.of(context).colorScheme.onSurface
                      : MyThemeData.whiteColor,
                  fontWeight: FontWeight.w300,
                  fontSize: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),

              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          TextField(
            controller: descriptionController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: "Description",
              labelStyle: TextStyle(
                  color: themeProvider.mode == ThemeMode.light
                      ? Theme.of(context).colorScheme.onSurface
                      : MyThemeData.whiteColor,
                  fontWeight: FontWeight.w300,
                  fontSize: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Text(
            "Select Date",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: themeProvider.mode == ThemeMode.light
                  ? Theme.of(context).colorScheme.onSurface
                  : Theme.of(context).colorScheme.surface,
            ),
          ),
          SizedBox(
            height: 18,
          ),
          GestureDetector(
            onTap: () {
              chooseYourDate();
            },
            child: Center(
              child: Text(
                selectedDate.toString().substring(0, 10),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: themeProvider.mode == ThemeMode.light
                      ? Theme.of(context).colorScheme.onSurface
                      : Theme.of(context).colorScheme.surface,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
                onPressed: () {
                  print("hereeee ${DateUtils.dateOnly(selectedDate)}");
                  TaskModel model = TaskModel(
                      title: titleController.text,
                      userId: FirebaseAuth.instance.currentUser?.uid ?? "",
                      description: descriptionController.text,
                      date: DateUtils.dateOnly(selectedDate)
                          .millisecondsSinceEpoch);
                  FirebaseFunctions.addTask(model).then((value) {
                    Navigator.pop(context);
                  });
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: Text(
                  "Add",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )),
          )
        ],
      ),
    );
  }

  chooseYourDate() async {
    DateTime? chosenDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        Duration(days: 365),
      ),
    );
    if (chosenDate != null) {
      selectedDate = chosenDate;
      setState(() {});
    }
  }
}
