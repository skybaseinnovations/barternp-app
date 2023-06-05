class User {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? gender;
  double? latitude;
  double? longitude;
  String? location;
  String? socialUniqueId;
  String? socialProvider;
  String? status;
  String? avatarUrl;

  User(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.gender,
      this.latitude,
      this.longitude,
      this.location,
      this.socialUniqueId,
      this.socialProvider,
      this.status,
      this.avatarUrl});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    gender = json['gender'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    location = json['location'];
    socialUniqueId = json['social_unique_id'];
    socialProvider = json['social_provider'];
    status = json['status'];
    avatarUrl = json['avatar_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['gender'] = gender;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['location'] = location;
    data['social_unique_id'] = socialUniqueId;
    data['social_provider'] = socialProvider;
    data['status'] = status;
    data['avatar_url'] = avatarUrl;
    return data;
  }
}
