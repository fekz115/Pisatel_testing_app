import 'package:flutter/material.dart';
import 'package:pisatel_testing_app/domain/comment.dart';

class CommentWidget extends StatelessWidget {
  
  final Comment comment;

  const CommentWidget({Key key, this.comment}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(comment.name),
          Text(comment.email),
          Text(comment.body),
        ],
      ),
    );
  }

}