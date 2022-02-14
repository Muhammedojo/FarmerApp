class CooperativeListModel {
  String? message;
  String? responseCode = "-100";
  int? count;
  int? statusCode;
  List<Data>? data;

  CooperativeListModel(
      {this.statusCode,
      this.responseCode,
      this.message,
      this.count, this.data});

  factory CooperativeListModel.fromJson(Map<String, dynamic> json) =>
      CooperativeListModel(
        message: json["message"],
        responseCode: json["responseCode"],
        count: json["count"],
        statusCode: json["statusCode"],
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      );
}

class Data {
  Data(
      {this.pk,
      this.temp_pk,
      required this.name,
      this.code,
      this.chairman,
      this.secretary,
      this.cell,
      this.ward,
      this.lga,
      this.warehouse});
  int? pk;
  String? temp_pk;
  String name;
  String? code;
  String? chairman;
  String? secretary;
  int? cell;
  int? ward;
  int? lga;
  int? warehouse;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        pk: json['pk'],
        temp_pk: json['temp_pk'],
        name: json['name'],
        code: json['code'],
        chairman: json['chairman'],
        secretary: json['secretary'],
        cell: json['cell'],
        ward: json['ward'],
        lga: json['lga'],
        warehouse: json['warehouse'],
      );

  Map<String,dynamic> toJson()=>{
    "pk": pk,
    "temp_pk": temp_pk,
    "name": name,
    "code": code,
    "chairman": chairman,
    "secretary": secretary,
    "cell": cell,
    "ward": ward,
    "lga": lga,
    "warehouse": warehouse
  };
}

// CooperativeListModel _cooperativeListModelFromJson(Map<String, dynamic> json) {
//   CooperativeListModel cooperative = CooperativeListModel();
//   if (json.containsKey('message')) cooperative.message = json["message"];
//   if (json.containsKey('responseCode'))
//     cooperative.responseCode = json["responseCode"];
//   if (json.containsKey('count')) cooperative.count = json["count"];
//   if (json.containsKey("statusCode"))
//     cooperative.statusCode = json["statusCode"];
//   List<Object> data = [];
//   if (json.containsKey("data")) {
//     List dataFromJson = json["data"] as List;
//     for (var data in dataFromJson) {
//       data.add(data);
//     }
//   }
//   cooperative.data = data;
//
//   return cooperative;
// }
