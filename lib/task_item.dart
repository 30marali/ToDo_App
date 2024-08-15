
import 'package:flutter/material.dart';
import 'package:todo_app/task_model.dart';


class TaskItem extends StatelessWidget {
  TaskModel model;
   TaskItem({required this.model , super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      margin: EdgeInsets.symmetric(horizontal: 12),
      width: double.infinity,
       decoration: BoxDecoration(
           color: Colors.white, borderRadius: BorderRadius.circular(25)),
      // child: Slidable(
      //   startActionPane:
      //   ActionPane(motion: DrawerMotion(), extentRatio: .6, children: [
      //     SlidableAction(
      //       onPressed: (context) {},
      //       label: "Delete",
      //       backgroundColor: Colors.red,
      //       icon: Icons.delete,
      //       spacing: 8,
      //       padding: EdgeInsets.zero,
      //       borderRadius: BorderRadius.only(
      //           topLeft: Radius.circular(25), bottomLeft: Radius.circular(25)),
      //     ),
      //     SlidableAction(
      //       onPressed: (context) {},
      //       label: "Edit",
      //       backgroundColor: Colors.blue,
      //       icon: Icons.edit,
      //       spacing: 8,
      //     ),
      //   ]),
      //   child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Container(
                height: 80,
                width: 4,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(25)),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.title,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    Text(
                      model.description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Icon(
                  Icons.done,
                  color: Colors.white,
                  size: 30,
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
              ),
            ],
          ),
    //    ),
    //  ),
    );
  }
}