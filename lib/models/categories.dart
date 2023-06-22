class CategoryDetails {
  String? id;
  String? title;
  String? createdAt;
  String? updatedAt;
  String? thumbnail;
  bool? hasSubcategory;

  CategoryDetails({
    this.id,
    this.title,
    this.createdAt,
    this.updatedAt,
    this.thumbnail,
  });

  CategoryDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    thumbnail = json['thumbnail'];
    hasSubcategory = json['has_subcategory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['thumbnail'] = thumbnail;
    data['has_subcategory'] = hasSubcategory;
return data;
  }
}

List<CategoryDetails> categorisefromJson(List<dynamic> categoryjson) => List<CategoryDetails>.from(
    categoryjson.map((categoryJson) => CategoryDetails.fromJson(categoryJson)));
