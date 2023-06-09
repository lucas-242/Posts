class Post {
  Post({
    this.id = -1,
    required this.title,
    required this.author,
    required this.ups,
    required this.commentsQuantity,
    required this.created,
    this.isLocal = false,
  });
  final int id;
  final String title;
  final String author;
  final int ups;
  final int commentsQuantity;
  final DateTime created;
  final bool isLocal;

  Post copyWith({
    int? id,
    String? title,
    String? author,
    int? ups,
    int? commentsQuantity,
    DateTime? created,
    bool? isLocal,
  }) {
    return Post(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      ups: ups ?? this.ups,
      commentsQuantity: commentsQuantity ?? this.commentsQuantity,
      created: created ?? this.created,
      isLocal: isLocal ?? this.isLocal,
    );
  }
}
