class PostAdsModel {
  String? categoryId;
  String? subcategoryId;
  String? title;
  String? description;
  AdsPosition? position;
  String? latitude;
  String? longitude;
  bool? isFeatured;
  int? price;
  List<dynamic>? fields;
  List<dynamic>? images;
  List<dynamic>? removedImageId;
  PostAdsModel(
      {this.categoryId,
      this.subcategoryId,
      this.title,
      this.description,
      this.position,
      this.latitude,
      this.longitude,
      this.isFeatured,
      this.price,
      this.fields,
      this.images,
      this.removedImageId});

  PostAdsModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    subcategoryId = json['subcategory_id'];
    title = json['title'];
    description = json['description'];
    position = json['position'] != null ? AdsPosition.fromJson(json['position']) : null;
    latitude = json['latitude'];
    longitude = json['longitude'];
    isFeatured = json['is_featured'];
    price = json['price'];
    if (json['fields'] != null) {
      fields = <Fields>[];
      json['fields'].forEach((v) {
        fields!.add(Fields.fromJson(v));
      });
    }
    images = json['images'].cast<String>();
    removedImageId = json['removedImageId'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['subcategory_id'] = subcategoryId;
    data['title'] = title;
    data['description'] = description;
    if (position != null) {
      data['position'] = position!.toJson();
    }
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['is_featured'] = isFeatured;
    data['price'] = price;
    if (fields != null) {
      data['fields'] = fields!.map((v) => v.toJson()).toList();
    }
    data['removedImageId'] = removedImageId;
    data['images'] = images;

    return data;
  }
}

class AdsPosition {
  String? name;
  LatLng? latLng;

  AdsPosition({this.name, this.latLng});

  AdsPosition.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    latLng = json['latLng'] != null ? LatLng.fromJson(json['latLng']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (latLng != null) {
      data['latLng'] = latLng!.toJson();
    }
    return data;
  }
}

class LatLng {
  double? latitude;
  double? longitude;

  LatLng({this.latitude, this.longitude});

  LatLng.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}

class Fields {
  String? label;
  String? value;

  Fields({this.label, this.value});

  Fields.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['label'] = label;
    data['value'] = value;
    return data;
  }
}

List<PostAdsModel> postAdsFromJson(List<dynamic> postAdsFromJson) =>
    List<PostAdsModel>.from(postAdsFromJson.map((fieldJson) => PostAdsModel.fromJson(fieldJson)));
