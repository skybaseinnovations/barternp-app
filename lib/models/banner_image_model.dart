class BannerImage {
  String? id;
  String? title;
  String? createdAt;
  String? updatedAt;
  String? imageUrl;

  BannerImage({this.id, this.title, this.createdAt, this.updatedAt, this.imageUrl});

  BannerImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['image_url'] = imageUrl;

    return data;
  }
}

List<BannerImage> bannersFromJson(List<dynamic> bannersJson) =>
    List<BannerImage>.from(bannersJson.map((categoryJson) => BannerImage.fromJson(categoryJson)));
