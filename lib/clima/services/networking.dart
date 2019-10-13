import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url;
  NetworkHelper({this.url});

  double latitude;
  double longitude;

  Future<dynamic> getData() async {
    final http.Response resp = await http.get(url);

    if (resp.statusCode == 200) {
      return jsonDecode(resp.body);
    } else {
      debugPrint('statusCode = ${resp.statusCode.toString()}');
    }
  }
}
