// To parse this JSON data, do
//
//     final aPiFeatureStoresResult = aPiFeatureStoresResultFromJson(jsonString);

import 'dart:convert';

APiFeatureStoresResult aPiFeatureStoresResultFromJson(String str) => APiFeatureStoresResult.fromJson(json.decode(str));

String aPiFeatureStoresResultToJson(APiFeatureStoresResult data) => json.encode(data.toJson());

class APiFeatureStoresResult {
  APiFeatureStoresResult({
    this.stores,
  });

  Stores? stores;

  factory APiFeatureStoresResult.fromJson(Map<String, dynamic> json) => APiFeatureStoresResult(
    stores: Stores.fromJson(json["stores"]),
  );

  Map<String, dynamic> toJson() => {
    "stores": stores?.toJson(),
  };
}

class Stores {
  Stores({
    this.data,
    this.code,
    this.success,
    this.message,
  });

  Data? data;
  int? code;
  bool? success;
  String? message;

  factory Stores.fromJson(Map<String, dynamic> json) => Stores(
    data: Data.fromJson(json["data"]),
    code: json["code"],
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "code": code,
    "success": success,
    "message": message,
  };
}

class Data {
  Data({
    this.items,
    this.pageInfo,
  });

  List<Store>? items;
  PageInfo? pageInfo;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    items: List<Store>.from(json["items"].map((x) => Store.fromJson(x))),
    pageInfo: PageInfo.fromJson(json["pageInfo"]),
  );

  Map<String, dynamic> toJson() => {
    "items": List<dynamic>.from(items?.map((x) => x.toJson()) ?? []),
    "pageInfo": pageInfo?.toJson(),
  };
}

class Store {
  Store({
    this.id,
    this.image,
    this.name,
    this.city,
    this.rate,
    this.bio,
    this.isFollowed,
    this.isOwner,
    this.user,
  });

  String? id;
  String? image;
  String? name;
  City? city;
  int? rate;
  String? bio;
  bool? isFollowed;
  bool? isOwner;
  User? user;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    id: json["id"],
    image: json["image"],
    name: json["name"],
    city: City.fromJson(json["city"]),
    rate: json["rate"],
    bio: json["bio"],
    isFollowed: json["isFollowed"],
    isOwner: json["isOwner"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "name": name,
    "city": city?.toJson(),
    "rate": rate,
    "bio": bio,
    "isFollowed": isFollowed,
    "isOwner": isOwner,
    "user": user?.toJson(),
  };
}

class City {
  City({
    this.id,
    this.arName,
    this.enName,
  });

  String? id;
  String? arName;
  String? enName;

  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json["id"],
    arName: json["arName"],
    enName: json["enName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "arName": arName,
    "enName": enName,
  };
}

class User {
  User({
    this.id,
    this.userName,
    this.profilePicture,
  });

  String? id;
  String? userName;
  String? profilePicture;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    userName: json["userName"],
    profilePicture: json["profilePicture"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userName": userName,
    "profilePicture": profilePicture,
  };
}

class PageInfo {
  PageInfo({
    this.page,
    this.limit,
    this.hasNext,
  });

  int? page;
  int? limit;
  bool? hasNext;

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
    page: json["page"],
    limit: json["limit"],
    hasNext: json["hasNext"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "limit": limit,
    "hasNext": hasNext,
  };
}
