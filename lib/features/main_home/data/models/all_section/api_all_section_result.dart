import 'dart:convert';

APiAllSectionResult aPiAllSectionResultFromJson(String str) =>
    APiAllSectionResult.fromJson(json.decode(str));

String aPiAllSectionResultToJson(APiAllSectionResult data) =>
    json.encode(data.toJson());

class APiAllSectionResult {
  APiAllSectionResult({
     this.sections,
  });

  Sections? sections;

  factory APiAllSectionResult.fromJson(Map<String, dynamic> json) =>
      APiAllSectionResult(
        sections: Sections.fromJson(json["sections"]),
      );

  Map<String, dynamic> toJson() => {
        "sections": sections?.toJson(),
      };
}

class Sections {
  Sections({
     this.code,
     this.message,
     this.success,
     this.data,
  });

  int? code;
  String? message;
  bool? success;
  List<Category>? data;

  factory Sections.fromJson(Map<String, dynamic> json) => Sections(
        code: json["code"] == null ? null :json["code"],
        message: json["message"],
        success: json["success"],
        data: List<Category>.from(json["data"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "success": success,
        "data": List<dynamic>.from(data?.map((x) => x.toJson()) ?? []),
      };
}

class Category {
  Category({
    this.id,
    this.arName,
    this.enName,
    this.thumbnail,
    this.subCategories,
  });

  String? id;
  String? arName;
  String? enName;
  String? thumbnail;
  List<Category>? subCategories;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        arName: json["arName"],
        enName: json["enName"],
        thumbnail: json["thumbnail"],
        subCategories: json["subCategories"] == null
            ? null
            : List<Category>.from(
                json["subCategories"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "arName": arName,
        "enName": enName,
        "thumbnail": thumbnail,
        "subCategories": subCategories == null
            ? null
            : List<dynamic>.from(subCategories?.map((x) => x.toJson()) ?? []),
      };
}
