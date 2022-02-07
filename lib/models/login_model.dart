import 'dart:core';

class UserModel {
  final String? username;
  final String? password;
  final String? token;
  final String? message;
  bool? isRequestedSuccess = false;

  UserModel(
      {required this.username,
      this.password,
      required this.token,
      this.message,
      this.isRequestedSuccess});
}

class UserDetailsModel {
  String? username;
  String? token;
  String? message;
  List<int>? cellIds;
  String? currency;
  String? deviceId;
  String? firstSubdivision;
  bool? initialPasswordChanged;
  List<int>? locationCodes;
  List<String>? permissions;
  String? responseCode = "-100";
  String? secondSubdivision;
  String? tenantLogo;
  String? tenantName;
  String? tenantPhone;
  bool? useOutreach;
  int? userId;
  List<int>? warehouseIds;

  UserDetailsModel(
      {this.username,
      this.token,
      this.message,
      this.cellIds,
      this.currency,
      this.deviceId,
      this.firstSubdivision,
      this.initialPasswordChanged,
      this.locationCodes,
      this.permissions,
      this.responseCode,
      this.secondSubdivision,
      this.tenantLogo,
      this.tenantName,
      this.tenantPhone,
      this.useOutreach,
      this.userId,
      this.warehouseIds});

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) =>
      _userDetailsModelFromJson(json);

  bool isRequestSuccessful() => responseCode == "100";
}

UserDetailsModel _userDetailsModelFromJson(Map<String, dynamic> json) {
  UserDetailsModel user = UserDetailsModel();
  if (json.containsKey("username")) user.username = json["username"];
  if (json.containsKey("user_id")) user.userId = json["user_id"];
  if (json.containsKey("token")) user.token = json["token"];
  if (json.containsKey("message")) user.message = json["message"];
  List<int> cellIdsList = [];
  if (json.containsKey("cell_ids")) {
    List cellIdsFromJson = json["cell_ids"] as List;
    for (var cellId in cellIdsFromJson) {
      cellIdsList.add(cellId);
    }
  }
  user.cellIds = cellIdsList;

  if (json.containsKey("currency")) user.currency = json["currency"];

  if (json.containsKey("device_id")) user.deviceId = json["device_id"];

  if (json.containsKey("first_subdivision"))
    user.firstSubdivision = json["first_subdivision"];

  if (json.containsKey("initial_password_changed"))
    user.initialPasswordChanged = json["initial_password_changed"];

  List<int> locationCodesList = [];
  if (json.containsKey("location_codes")) {
    List locationCodesFromJson = json["location_codes"] as List;
    for (var locationCodes in locationCodesFromJson) {
      locationCodesList.add(locationCodes);
    }
  }
  user.locationCodes = locationCodesList;
  List<String> permissionList = [];
  if (json.containsKey("permissions")) {
    List permissionFromJson = json["permissions"] as List;
    for (var permission in permissionFromJson) {
      permissionList.add(permission);
    }
  }
  user.permissions = permissionList;

  if (json.containsKey("responseCode"))
    user.responseCode = json["responseCode"];
  if (json.containsKey("second_subdivision"))
    user.secondSubdivision = json["second_subdivision"];
  if (json.containsKey("tenant_logo")) user.tenantLogo = json["tenant_logo"];
  if (json.containsKey("tenant_phone")) user.tenantPhone = json["tenant_phone"];
  if (json.containsKey("tenant_name")) user.tenantName = json["tenant_name"];
  if (json.containsKey("use_outreach")) user.useOutreach = json["use_outreach"];

  List<int> warehouseIdsList = [];
  if (json.containsKey("warehouse_ids")) {
    List warehouseIdsFromJson = json["warehouse_ids"] as List;
    for (var warehouseId in warehouseIdsFromJson) {
      warehouseIdsList.add(warehouseId);
    }
    user.warehouseIds = warehouseIdsList;
  }

  return user;
}

// factory WarehouseIds.fromJson(Map<String, dynamic> json) => WarehouseIds(
//   warehouseIds: WarehouseIds!.fromJson(json["warehouseIds"]),
// );

// Map _toJson(UserDetailsModel userDetailsModel) {
//   var device_id;
//   return <String, dynamic>{
//     device_id: userDetailsModel.device_id,
//     // username: userDetailsModel.username,
//     // password: userDetailsModel.password,
//   };
// }
