// ignore_for_file: unnecessary_new

import 'package:barter_app_2023/models/fields_model.dart';

class CategoryDetails {
  String? id;
  String? title;
  String? createdAt;
  String? updatedAt;
  String? thumbnail;
  bool? hasSubcategory;
  List<FieldDetails>? fields;
  CategoryDetails({
    this.id,
    this.title,
    this.createdAt,
    this.updatedAt,
    this.thumbnail,
    this.fields,
  });

  CategoryDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    thumbnail = json['thumbnail'];
    hasSubcategory = json['has_subcategory'];
    if (json['fields'] != null) {
      fields = <FieldDetails>[];
      json['fields'].forEach((v) {
        fields!.add(new FieldDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['thumbnail'] = thumbnail;
    data['has_subcategory'] = hasSubcategory;
    if (fields != null) {
      data['fields'] = fields!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

List<CategoryDetails> categorisefromJson(List<dynamic> categoryjson) => List<CategoryDetails>.from(
    categoryjson.map((categoryJson) => CategoryDetails.fromJson(categoryJson)));
