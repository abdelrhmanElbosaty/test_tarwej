import 'dart:convert';

APiRegisterResult aPiRegisterResultFromJson(String str) => APiRegisterResult.fromJson(json.decode(str));

String aPiRegisterResultToJson(APiRegisterResult data) => json.encode(data.toJson());

class APiRegisterResult {
  APiRegisterResult({
    required this.data,
  });

  Data data;

  factory APiRegisterResult.fromJson(Map<String, dynamic> json) => APiRegisterResult(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.register,
  });

  Register register;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    register: Register.fromJson(json["register"]),
  );

  Map<String, dynamic> toJson() => {
    "register": register.toJson(),
  };
}

class Register {
  Register({
    required this.code,
    required this.success,
    required this.message,
  });

  int code;
  bool success;
  String message;

  factory Register.fromJson(Map<String, dynamic> json) => Register(
    code: json["code"],
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "success": success,
    "message": message,
  };
}
