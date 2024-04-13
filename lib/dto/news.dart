class News {
  final String id;
  final String title;
  final String body;
  final String photo;

  News({required this.id, required this.title, required this.body, required this.photo,});

  factory News.fromJson(Map<String, dynamic> json) => News(
        id: json['id'],
        title: json['title'],
        body: json['body'],
        photo : json['photo'],
      );
}
