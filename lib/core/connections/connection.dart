import 'package:reddit_posts/core/connections/models/connection_response.dart';

abstract interface class Connection {
  Future<ConnectionResponse> get(String url);
  Future<ConnectionResponse> post(String url);
  Future<ConnectionResponse> put(String url);
  Future<ConnectionResponse> patch(String url);
  Future<ConnectionResponse> delete(String url);
}
