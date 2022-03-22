class FarmersListModel {
  String? message;
  String? responseCode = "-100";
  int? count;
  String? next;
  String? previous;
  int? statusCode;
  List<Data>? data;

  FarmersListModel(
      {this.statusCode,
      this.previous,
      this.responseCode,
      this.message,
      this.count,
      this.next,
       this.data});

  factory FarmersListModel.fromJson(Map<String, dynamic> json) =>
      _farmersListModelFromJson(json);
}

FarmersListModel _farmersListModelFromJson(Map<String, dynamic> json) {
  FarmersListModel farmer = FarmersListModel();
  if (json.containsKey('message')) farmer.message = json["message"];
  if (json.containsKey('responseCode'))
    farmer.responseCode = json["responseCode"];
  if (json.containsKey('count')) farmer.count = json["count"];
  if (json.containsKey('next')) farmer.next = json["next"];
  if (json.containsKey('previous')) farmer.previous = json["previous"];
  if (json.containsKey("statusCode")) farmer.statusCode = json["statusCode"];
  List<Data> data = [];
  if (json.containsKey("data")) {
    List dataFromJson = json["data"] as List;
    for (var data in dataFromJson) {
      data.add(data);
    }
  }
  farmer.data = data;

  return farmer;
}

class Data {
  String first_name, last_name, folio_id;

  Data(
      {required this.first_name,
      required this.last_name,
      required this.folio_id});
  factory Data.fromJSON(Map<String, dynamic> parsedJson) {
    return Data(
      first_name: parsedJson['first_name'],
      last_name: parsedJson['last_name'],
      folio_id: parsedJson['folio_id'],
    );
  }
}
