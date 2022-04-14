import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_http_flutter/models/araba_model.dart';

class LocalJsonView extends StatefulWidget {
  const LocalJsonView({Key? key}) : super(key: key);

  @override
  State<LocalJsonView> createState() => _LocalJsonState();
}

late final Future<List<ArabaModel>> listeyiDoldur;

class _LocalJsonState extends State<LocalJsonView> {
  @override
  void initState() {
    super.initState();
    listeyiDoldur = arabalarJsonOku();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("local json"),
      ),
      body: FutureBuilder<List<ArabaModel>>(
        future: listeyiDoldur,
        builder: (context, snapshot) {
          List<ArabaModel>? arabaListesi = snapshot.data;
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: arabaListesi!.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(arabaListesi[index].arabaAdi.toString()),
                  subtitle: Text(arabaListesi[index].ulke.toString()),
                  leading: CircleAvatar(
                      child: Text(
                          arabaListesi[index].model![0].modelAdi.toString())),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<List<ArabaModel>> arabalarJsonOku() async {
    String okunanString = await DefaultAssetBundle.of(context)
        .loadString("assets/data/arabalar.json");
    var jsonObject = jsonDecode(okunanString);

    List<ArabaModel> tumArabalar = (jsonObject as List)
        .map((arabaMap) => ArabaModel.fromJson(arabaMap))
        .toList();
    debugPrint(tumArabalar[0].model![0].modelAdi);
    return tumArabalar;
  }
}
