class TodoFields{
  static String id="id";
  static String title = "title";
  static String description = "description";
  static String date = "date";
  static String priority = "priority";
  static String isCompleted = "isCompleted";
  static String isCompleted1 = "isCompleted";


}

class TodoModel{
  final int? id;
  final String title;
  final String description;
  final String date;
  final String priority;
  final int isCompleted;
  final int isCompleted1;



  TodoModel({
    this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.priority,
    required this.isCompleted,
    required this.isCompleted1

});

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'] ?? -1,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      date: json['date'] ?? '',
      priority: json['priority'] ?? '',
      isCompleted: json['isCompleted'] ?? -1,
      isCompleted1: json['isCompleted'] ?? 9,

    );
  }
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'date': date,
      'priority': priority,
      'isCompleted': isCompleted,
      'isCompleted1': isCompleted1,

    };
  }

  TodoModel copyWith({
    int? id,
    String? title,
    String? description,
    String? date,
    String? priority,
    int? isCompleted,
  }) =>
      TodoModel(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        date: date ?? this.date,
        priority: priority ?? this.priority,
        isCompleted: isCompleted ?? this.isCompleted,
        isCompleted1: isCompleted1 ?? this.isCompleted1,

      );

}