class TodoTaskModel{
  late int id;
  late String title;
  late String date;
  late String time;
  late String status;


  TodoTaskModel({
    required this.id,
    required this.title,
    required this.date,
    required this.time,
    required this.status
  });

  TodoTaskModel.fromJson(){

  }
}
