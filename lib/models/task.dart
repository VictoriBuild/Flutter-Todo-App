class Task {
  String id;
  String title;
  bool isCompleted;
  DateTime createdAt;
  String? note;
  
  Task({
    required this.title,
    this.isCompleted = false,
    String? id,
    DateTime? createdAt,
    this.note,
  }) : 
    id = id ?? DateTime.now().millisecondsSinceEpoch.toString(),
    createdAt = createdAt ?? DateTime.now();
}
