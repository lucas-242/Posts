import 'dart:convert';

final class ConnectionResponse {
  ConnectionResponse(this.body);

  final String body;
  Iterable<Map<String, dynamic>> get json => jsonDecode(body);
}
