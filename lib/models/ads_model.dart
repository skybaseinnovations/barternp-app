import 'package:barter_app_2023/models/categories.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../widgets/custom/time_age_message.dart';

List<AdsDetail> adsModelfromJson(List<dynamic> adsModelsJson) =>
    List<AdsDetail>.from(adsModelsJson.map((adsModelJson) => AdsDetail.fromJson(adsModelJson)));

class AdsDetail {
  String? id;
  String? userId;
  String? categoryId;
  String? subCategoryId;
  String? title;
  String? adId;
  String? description;
  int? isFeatured;
  int? price;
  String? latitude;
  String? longitude;
  int? sold;
  String? expiredAt;
  String? soldTo;
  String? status;
  String? createdAt;
  String? updatedAt;
  List<String>? images;
  String? thumbnail;
  String? location;
  OwnerDetailModel? seller;
  OwnerDetailModel? buyer;
  CategoryDetails? category;
  CategoryDetails? subcategory;

  AdsDetail({
    this.id,
    this.userId,
    this.categoryId,
    this.subCategoryId,
    this.title,
    this.adId,
    this.description,
    this.isFeatured,
    this.price,
    this.latitude,
    this.longitude,
    this.sold,
    this.expiredAt,
    this.soldTo,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.images,
    this.thumbnail,
    this.location,
    this.seller,
    this.buyer,
    this.category,
    this.subcategory,
  });

  AdsDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    title = json['title'];
    adId = json['adId'];
    description = json['description'];

    isFeatured = json['is_featured'];
    price = json['price'];

    latitude = json['latitude'];
    longitude = json['longitude'];
    sold = json['sold'];
    expiredAt = json['expired_at'];
    soldTo = json['sold_to'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    images = json['images'].cast<String>();
    thumbnail = json['thumbnail'];
    location = json['location'];
    seller = json['seller'] != null ? OwnerDetailModel.fromJson(json['seller']) : null;
    buyer = json['buyer'] != null ? OwnerDetailModel.fromJson(json['buyer']) : null;
    category = json['category'] != null ? CategoryDetails.fromJson(json['category']) : null;
    subcategory =
        json['subcategory'] != null ? CategoryDetails.fromJson(json['subcategory']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['category_id'] = categoryId;
    data['sub_category_id'] = subCategoryId;
    data['title'] = title;
    data['adId'] = adId;
    data['description'] = description;
    data['is_featured'] = isFeatured;
    data['price'] = price;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['sold'] = sold;
    data['expired_at'] = expiredAt;
    data['sold_to'] = soldTo;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['images'] = images;
    data['thumbnail'] = thumbnail;
    data['location'] = location;
    if (seller != null) {
      data['seller'] = seller!.toJson();
    }
    if (buyer != null) {
      data['buyer'] = buyer!.toJson();
    }
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (subcategory != null) {
      data['subcategory'] = subcategory!.toJson();
    }

    return data;
  }

  static bool isfeatured(int? value) {
    return value == 0 ? true : false;
  }

  static returnDate(String date) {
    timeago.setLocaleMessages('en', MyCustomMessages());
    DateTime updatedDate = DateTime.parse(date);
    return timeago.format(updatedDate);
  }
}

class OwnerDetailModel {
  String? id;
  String? name;
  String? email;

  OwnerDetailModel({this.id, this.name, this.email});

  OwnerDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}
