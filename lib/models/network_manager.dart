import 'dart:convert';

import 'package:http/http.dart' as http;

import './post_data.dart';

class NetworkManager {
  Future<Results> fetchPosts() async {
    String url = 'http://hn.algolia.com/api/v1/search?tags=front_page';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return Results.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
