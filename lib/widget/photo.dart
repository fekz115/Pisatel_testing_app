import 'package:flutter/material.dart';
import 'package:pisatel_testing_app/domain/photo.dart';

typedef void OnPhotoTap(Photo photo);

class PhotoWidget extends StatelessWidget {
  final Photo _photo;
  final OnPhotoTap onPhotoTap;

  const PhotoWidget(this._photo, {this.onPhotoTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipOval(
        child: CircleAvatar(
          child: Image.network(
            _photo.thumbnailUrl,
          ),
        ),
      ),
      title: Text(_photo.title),
      onTap: () {
        if (onPhotoTap != null) {
          onPhotoTap(_photo);
        }
      },
    );
  }
}
