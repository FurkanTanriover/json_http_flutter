class ArabaModel {
  String? arabaAdi;
  String? ulke;
  int? kurulusYil;
  List<Model>? model;

  ArabaModel({this.arabaAdi, this.ulke, this.kurulusYil, this.model});

  ArabaModel.fromJson(Map<String, dynamic> json) {
    arabaAdi = json['araba_adi'];
    ulke = json['ulke'];
    kurulusYil = json['kurulus_yil'];
    if (json['model'] != null) {
      model = <Model>[];
      json['model'].forEach((v) {
        model!.add(Model.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['araba_adi'] = arabaAdi;
    data['ulke'] = ulke;
    data['kurulus_yil'] = kurulusYil;
    if (model != null) {
      data['model'] = model!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Model {
  String? modelAdi;
  int? fiyat;
  bool? benzinli;

  Model({this.modelAdi, this.fiyat, this.benzinli});

  Model.fromJson(Map<String, dynamic> json) {
    modelAdi = json['model_adi'];
    fiyat = json['fiyat'];
    benzinli = json['benzinli'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['model_adi'] = modelAdi;
    data['fiyat'] = fiyat;
    data['benzinli'] = benzinli;
    return data;
  }
}
