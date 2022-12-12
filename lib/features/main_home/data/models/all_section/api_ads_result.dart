// To parse this JSON data, do
//
//     final aPiAdsResult = aPiAdsResultFromJson(jsonString);

import 'dart:convert';

APiAdsResult aPiAdsResultFromJson(String str) => APiAdsResult.fromJson(json.decode(str));

String aPiAdsResultToJson(APiAdsResult data) => json.encode(data.toJson());

class APiAdsResult {
  APiAdsResult({
    this.advertisements,
  });

  Advertisements? advertisements;

  factory APiAdsResult.fromJson(Map<String, dynamic> json) => APiAdsResult(
    advertisements: Advertisements.fromJson(json["advertisements"]),
  );

  Map<String, dynamic> toJson() => {
    "advertisements": advertisements?.toJson(),
  };
}

class Advertisements {
  Advertisements({
    this.code,
    this.message,
    this.data,
  });

  int? code;
  String? message;
  Data? data;

  factory Advertisements.fromJson(Map<String, dynamic> json) => Advertisements(
    code: json["code"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    this.pageInfo,
    this.items,
  });

  PageInfo? pageInfo;
  List<Ads>? items;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    pageInfo: PageInfo.fromJson(json["pageInfo"]),
    items: List<Ads>.from(json["items"].map((x) => Ads.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "pageInfo": pageInfo?.toJson(),
    "items": List<dynamic>.from(items?.map((x) => x.toJson()) ?? []),
  };
}

class Ads {
  Ads({
    this.id,
    this.isFavorite,
    this.title,
    this.store,
    this.city,
    this.price,
    this.offerPrice,
    this.images,
    this.description,
    this.numberOfViews,
    this.createdAt,
  });

  String? id;
  bool? isFavorite;
  String? title;
  Store? store;
  City? city;
  int? price;
  int? offerPrice;
  List<String>? images;
  String? description;
  int? numberOfViews;
  int? createdAt;

  factory Ads.fromJson(Map<String, dynamic> json) => Ads(
    id: json["id"],
    isFavorite: json["isFavorite"],
    title: json["title"],
    store: Store.fromJson(json["store"]),
    city: City.fromJson(json["city"]),
    price: json["price"],
    offerPrice: json["offerPrice"] == null ? null : json["offerPrice"],
    images: List<String>.from(json["images"].map((x) => x)),
    description: json["description"],
    numberOfViews: json["numberOfViews"],
    createdAt: json["createdAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "isFavorite": isFavorite,
    "title": title,
    "store": store?.toJson(),
    "city": city?.toJson(),
    "price": price,
    "offerPrice": offerPrice == null ? null : offerPrice,
    "images": List<dynamic>.from(images?.map((x) => x) ?? []),
    "description": description,
    "numberOfViews": numberOfViews,
    "createdAt": createdAt,
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

class Store {
  Store({
    this.id,
    this.image,
    this.name,
    this.rate,
    this.isOwner,
    this.isFollowed,
    this.user,
    this.createdAt,
  });

  String? id;
  String? image;
  String? name;
  int? rate;
  bool? isOwner;
  bool? isFollowed;
  User? user;
  int? createdAt;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    id: json["id"],
    image: json["image"],
    name: json["name"],
    rate: json["rate"],
    isOwner: json["isOwner"],
    isFollowed: json["isFollowed"],
    user: User.fromJson(json["user"]),
    createdAt: json["createdAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "name": name,
    "rate": rate,
    "isOwner": isOwner,
    "isFollowed": isFollowed,
    "user": user?.toJson(),
    "createdAt": createdAt,
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
    this.limit,
    this.page,
    this.hasNext,
  });

  int? limit;
  int? page;
  bool? hasNext;

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
    limit: json["limit"],
    page: json["page"],
    hasNext: json["hasNext"],
  );

  Map<String, dynamic> toJson() => {
    "limit": limit,
    "page": page,
    "hasNext": hasNext,
  };
}
