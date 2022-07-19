import 'package:cloud_firestore/cloud_firestore.dart';

class ImageMap {
  final String? profile_pic;
  final String? shareuid;

  ImageMap({
    this.profile_pic,
    this.shareuid,
  });

  factory ImageMap.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return ImageMap(
      profile_pic: data?['profile_pic'],
      shareuid: data?['shareuid'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (profile_pic != null) "profile_pic": profile_pic,
      if (shareuid != null) "shareuid": shareuid,
    };
  }
}
