import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  final directory = Directory('public');
  final baseUrl = context.request.uri.origin;
  final files = directory.listSync();
  final lstUrl = <String>[];
  for (final file in files) {
    final childDirectory = Directory(file.path);
    final filexs = childDirectory.listSync();
    for (final filex in filexs) {
      final data = filex.path.replaceAll('public', baseUrl);
      lstUrl.add(data);
    }
  }
  return Response(body: lstUrl.toString());
}
