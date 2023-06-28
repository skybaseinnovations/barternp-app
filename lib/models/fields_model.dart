class FieldDetails {
  String? id;
  String? categoryId;
  String? subCategoryId;
  String? label;
  int? isPrice;
  int? required;
  String? type;
  List<String>? options;
  String? createdAt;
  String? updatedAt;

  FieldDetails(
      {this.id,
      this.categoryId,
      this.subCategoryId,
      this.label,
      this.isPrice,
      this.required,
      this.type,
      this.options,
      this.createdAt,
      this.updatedAt});

  FieldDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    label = json['label'];
    isPrice = json['is_price'];
    required = json['required'];
    type = json['type'];
    // options = json['options'].cast<String>();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['sub_category_id'] = subCategoryId;
    data['label'] = label;
    data['is_price'] = isPrice;
    data['required'] = required;
    data['type'] = type;
    data['options'] = options;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

List<FieldDetails> fieldsFromJson(List<dynamic> fieldsJson) =>
    List<FieldDetails>.from(fieldsJson.map((fieldJson) => FieldDetails.fromJson(fieldJson)));
