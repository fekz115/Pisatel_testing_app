import 'package:flutter/material.dart';
import 'package:pisatel_testing_app/domain/comment.dart';

class CommentWidget extends StatelessWidget {
  final Comment comment;

  const CommentWidget({Key key, this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              comment.name,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 3.0,),
            Text(
              comment.email,
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.black38,
              ),
            ),
            SizedBox(height: 10.0,),
            Text(comment.body),
          ],
        ),
      ),
    );
  }
}
