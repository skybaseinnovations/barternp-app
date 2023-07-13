class MediaDetails {
  int? id;
  String? originalUrl;
  String? previewUrl;

  MediaDetails({this.id, this.originalUrl, this.previewUrl});

  MediaDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    originalUrl = json['original_url'];
    previewUrl = json['preview_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['original_url'] = originalUrl;
    data['preview_url'] = previewUrl;
    return data;
  }
}
