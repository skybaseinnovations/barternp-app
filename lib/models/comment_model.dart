import 'package:barter_app_2023/models/user_model.dart';

List<CommentsModel> commentModelfromJson(List<dynamic> commentsModelsJson) =>
    List<CommentsModel>.from(
        commentsModelsJson.map((commentModelJson) => CommentsModel.fromJson(commentModelJson)));

class CommentsModel {
  int? id;
  String? comment;
  String? userId;
  String? commentableId;
  String? createdAt;
  User? commentator;

  CommentsModel(
      {this.id, this.comment, this.userId, this.commentableId, this.createdAt, this.commentator});

  CommentsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    comment = json['comment'];
    userId = json['user_id'];
    commentableId = json['commentable_id'];
    createdAt = json['created_at'];
    commentator = json['commentator'] != null ? User.fromJson(json['commentator']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['comment'] = comment;
    data['user_id'] = userId;
    data['commentable_id'] = commentableId;
    data['created_at'] = createdAt;
    if (commentator != null) {
      data['commentator'] = commentator!.toJson();
    }
    return data;
  }
}
