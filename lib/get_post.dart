import 'dart:convert';

import 'package:http/http.dart';

import 'get_post_model.dart';

class GetPost {
  final String posturl = "https://jsonplaceholder.typicode.com/posts";

  Future<List<Post>> getPosData() async {
    Response res = await get(posturl);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Post> postData =
          body.map((dynamic item) => Post.fromJson(item)).toList();
      return postData;
    } else {
      throw "Ga bisa dapet data";
    }
  }
}
