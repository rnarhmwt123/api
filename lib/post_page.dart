import 'package:flutter/material.dart';

import 'get_post.dart';
import 'get_post_model.dart';

class PostPage extends StatelessWidget {
  final GetPost _getPost = new GetPost();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Data Dari API"),
      ),
      body: FutureBuilder(
        future: _getPost.getPosData(),
        builder: (context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData) {
            List<Post> dataPost = snapshot.data;

            return ListView.builder(
                itemCount: dataPost.length,
                itemBuilder: (context, i) {
                  return Container(
                      child: Card(
                    child: Row(
                      children: [
                        Icon(
                          Icons.android,
                          size: 30,
                          color: Colors.black,
                        ),
                        Column(
                          children: [
                            Text(
                              dataPost[i].title,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ));
                });
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
