import 'dart:convert';

final class ConnectionResponse {
  ConnectionResponse(this.body);

  final String body;
  Map<String, dynamic> get json => jsonDecode(body);
}
