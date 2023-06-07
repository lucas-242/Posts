final class Post {

  Post({
    required this.title,
    required this.author,
    required this.ups,
    required this.commentsQuantity,
    required this.created,
  });
  final String title;
  final String author;
  final int ups;
  final int commentsQuantity;
  final DateTime created;
}
