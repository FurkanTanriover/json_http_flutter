import 'package:dio/dio.dart';
import 'package:json_http_flutter/models/post_model.dart';
import 'package:json_http_flutter/models/user_model.dart';
import 'package:riverpod/riverpod.dart';

final clientProvider = Provider<Dio>(((ref) {
  return Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));
}));

final userProvider = FutureProvider<List<User>>(
  (ref) async {
    final _dio = ref.watch(clientProvider);
    try {
      final response = await _dio.get("users");
      List<User> _userList = [];
      if (response.statusCode == 200) {
        _userList =
            (response.data as List).map((e) => User.fromJson(e)).toList();
      }
      return _userList;
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  },
);

final getPostProvider = FutureProvider<List<Post>>(((ref) async {
  final _dio = ref.watch(clientProvider);
  try {
    final response = await _dio.get("posts");
    List<Post> _postList = [];
    if (response.statusCode == 200) {
      _postList = (response.data as List).map((e) => Post.fromJson(e)).toList();
    }
    return _postList;
  } on DioError catch (e) {
    return Future.error(e.message);
  }
}));

final putPostProvider = FutureProvider.family<List<Post>, int>((ref, id) async {
  final _dio = ref.watch(clientProvider);
  try {
    final response = await _dio.put("posts", queryParameters: {"id": id});
    List<Post> _postList = [];
    if (response.statusCode == 200) {
      _postList = (response.data as List).map((e) => Post.fromJson(e)).toList();
    }
    return _postList;
  } on DioError catch (e) {
    return Future.error(e.message);
  }
});
