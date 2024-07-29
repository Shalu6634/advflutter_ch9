import 'package:flutter/material.dart';


class PixabayModal {
  List<Hit> hits = [];

  PixabayModal({required this.hits});

  factory PixabayModal.fromJson(Map m1) {
    return PixabayModal(
        hits: (m1['hits'] as List).map((e) => Hit.fromJson(e)).toList());
  }
}

class Hit {
  late String userImageURL, webformatURL, user;
  late int id, comments, likes, views, downloads;

  Hit(
      {required this.userImageURL,
      required this.webformatURL,
      required this.user,
      required this.id,
      required this.comments,
      required this.likes,
      required this.views,
      required this.downloads});

  factory Hit.fromJson(Map m1) {
    return Hit(
        userImageURL: m1['userImageURL'],
        webformatURL: m1['webformatURL'],
        user: m1['user'],
        id: m1['id'],
        comments: m1['comments'],
        likes: m1['likes'],
        views: m1['views'],
        downloads: m1['downloads']);
  }
}


