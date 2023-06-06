final class Post {
  final String title;
  final String author;
  final int ups;
  final int commentsQuantity;
  final DateTime created;

  Post({
    required this.title,
    required this.author,
    required this.ups,
    required this.commentsQuantity,
    required this.created,
  });
}
