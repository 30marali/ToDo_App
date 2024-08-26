import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/firebase_functions.dart';
import 'package:todo_app/models/task_model.dart';

class EditScreen extends StatefulWidget {
  static const String routeName = 'EditScreen';

  EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)!.settings.arguments as TaskModel;
    return Scaffold(
      backgroundColor: Color(0xFFdfecdb),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Edit Tasks",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Edit Task",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                    ),
                  ),
                ),
                Spacer(),
                TextFormField(
                    initialValue: model.title,
                    onChanged: (value) {
                      model.title = value;
                    },
                    decoration: InputDecoration(
                      labelText: "Title",
                    )),
                Spacer(),
                TextFormField(
                    initialValue: model.description,
                    onChanged: (value) {
                      model.description = value;
                    },
                    decoration: InputDecoration(
                      labelText: "Description",
                    )),
                Spacer(),
                Text(
                  "Select Time",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Center(
                    child: InkWell(
                  onTap: () async {
                    DateTime? newDate = await chooseYourDate();
                    if (newDate != null) {
                      model.date = newDate.millisecondsSinceEpoch;
                      setState(() {});
                    }
                  },
                  child: Text(
                    DateFormat.yMd().format(DateUtils.dateOnly(
                        DateTime.fromMillisecondsSinceEpoch(model.date ?? 0))),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                )),
                Spacer(),
                Center(
                    child: ElevatedButton(
                  onPressed: ()async {
                    FirebaseFunctions.updateTask(model);
                    Navigator.pop(context);
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding:
                          EdgeInsets.symmetric(horizontal: 60, vertical: 12)),
                  child: Text(
                    "Save Changes",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )),
                Spacer(
                  flex: 5,
                ),
              ],
            ),
          ),
        ),
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
    return chosenDate;
  }
}
