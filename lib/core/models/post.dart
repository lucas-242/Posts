class Post {
  Post({
    this.id = 0,
    required this.title,
    required this.author,
    required this.ups,
    required this.commentsQuantity,
    required this.created,
  });
  final int id;
  final String title;
  final String author;
  final int ups;
  final int commentsQuantity;
  final DateTime created;

  Post copyWith({
    int? id,
    String? title,
    String? author,
    int? ups,
    int? commentsQuantity,
    DateTime? created,
  }) {
    return Post(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      ups: ups ?? this.ups,
      commentsQuantity: commentsQuantity ?? this.commentsQuantity,
      created: created ?? this.created,
    );
  }
}
