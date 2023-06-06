import 'package:http/http.dart' as http;
import 'package:reddit_posts/core/connections/connection.dart';
import 'package:reddit_posts/core/connections/models/connection_response.dart';

final class ConnectionHttp implements Connection {
  @override
  Future<ConnectionResponse> delete(String url) async => http
      .delete(Uri.parse(url))
      .then((response) => ConnectionResponse(response.body));

  @override
  Future<ConnectionResponse> get(String url) async => http
      .get(Uri.parse(url))
      .then((response) => ConnectionResponse(response.body));

  @override
  Future<ConnectionResponse> post(String url) async => http
      .post(Uri.parse(url))
      .then((response) => ConnectionResponse(response.body));

  @override
  Future<ConnectionResponse> put(String url) async => http
      .put(Uri.parse(url))
      .then((response) => ConnectionResponse(response.body));

  @override
  Future<ConnectionResponse> patch(String url) async => http
      .patch(Uri.parse(url))
      .then((response) => ConnectionResponse(response.body));
}
