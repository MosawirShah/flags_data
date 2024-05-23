class Model {
  bool error;
  String msg;
  List<Data> data;

  Model({required this.error, required this.msg, required this.data});

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
        error: json['error'],
        msg: json['msg'],
        data: (json['data'] as List)
            .map((dataObj) => Data.fromJson(dataObj))
            .toList());
  }
}

class Data {
  String name;
  String flag;
  String iso2;
  String iso3;

  Data(
      {required this.name,
      required this.flag,
      required this.iso2,
      required this.iso3});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        name: json["name"],
        flag: json['flag'],
        iso2: json['iso2'],
        iso3: json['iso3']);
  }
}
