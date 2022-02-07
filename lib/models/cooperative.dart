import 'package:json_annotation/json_annotation.dart';

part 'cooperative.g.dart';

@JsonSerializable()
class Cooperative {
  @JsonKey(name : "message")
  late String message;

  @JsonKey(name : "responseCode")
  late int responseCode;

  @JsonKey(name : "count")
  late int count;

  @JsonKey(name : "data")
  late List<Cooperative> cooperatives;

  Cooperative();

  factory Cooperative.fromJson(Map<String, dynamic> json) => _$CooperativeFromJson(json);
  Map<String, dynamic> toJson() => _$CooperativeToJson(this);
}
