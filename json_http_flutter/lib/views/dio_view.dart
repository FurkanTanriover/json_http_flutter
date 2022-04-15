import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_http_flutter/providers/all_providers.dart';

class DioView extends ConsumerWidget {
  const DioView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int id = 0;
    var getUserList = ref.watch(userProvider);
    var getPostList = ref.watch(getPostProvider);
    var putPostList = ref.watch(putPostProvider(id));
    return Scaffold(
      appBar: AppBar(title: const Text("Dio view")),
      body: Center(
        child: getPostList.when(
            data: (getPostList) {
              return ListView.builder(
                itemCount: getPostList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(getPostList[index].id.toString()),
                    ),
                    title: Text(getPostList[index].title.toString()),
                    subtitle: Text(getPostList[index].body!.toString()),
                    trailing: const IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: null,
                    ),
                  );
                },
              );
            },
            error: (err, stack) {
              return Center(
                child: Text("hata ${err.toString()}"),
              );
            },
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )),
      ),
    );
  }
}
