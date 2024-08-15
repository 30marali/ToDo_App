import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/task_model.dart';

class FirebaseFunctions {
  static CollectionReference getTasksCollection() {
    return FirebaseFirestore.instance
        .collection('Tasks')
        .withConverter<TaskModel>(
      fromFirestore: (snapchot, _) {
        return TaskModel.fromJson(snapchot.data()!);
      },
      toFirestore: (taskModel, _) {
        return taskModel.toJson();
      },
    );
  }

  static Future<void> addTask(TaskModel model) async {
    var collection = getTasksCollection();
    var docRef = collection.doc();
    model.id = docRef.id;
    docRef.set(model);
  }

  static Stream<QuerySnapshot<TaskModel>> getTasks(DateTime dateTime) {
    var collection = getTasksCollection();
    return collection.where("date", isEqualTo: DateUtils.dateOnly(dateTime).millisecondsSinceEpoch).snapshots() as Stream<QuerySnapshot<TaskModel>> ;
  }

static Future<void>?deleteTask(String id){
    getTasksCollection().doc(id).delete();
  }

  static Future<void>?updateTask(TaskModel model){
    getTasksCollection().doc(model.id).update(model.toJson());
  }

}
