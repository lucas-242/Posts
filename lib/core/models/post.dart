final class Post {
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
}
