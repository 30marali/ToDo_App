class TaskModel {
  String id;
  String description;
  String title;
  int date;
  bool isDone;

  TaskModel({
    this.id = '',
    required this.description,
    required this.title,
    required this.date,
    this.isDone = false,
  });

  TaskModel.fromJson(Map<String, dynamic> json)
      :this(
      id: json['id'],
      description: json['description'],
      title: json['title'],
      date: json['date'],
      isDone: json['isDone'],
    );

  Map<String , dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "id": id,
      "date": date,
      "isDone": isDone,
    };
  }
}
