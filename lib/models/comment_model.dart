List<CommentsModel> commentModelfromJson(List<dynamic> commentsModelsJson) =>
    List<CommentsModel>.from(
        commentsModelsJson.map((commentModelJson) => CommentsModel.fromJson(commentModelJson)));

class CommentsModel {
  int? id;
  String? commentableType;
  String? commentableId;
  String? comment;
  bool? isApproved;
  String? userId;
  String? createdAt;
  String? updatedAt;

  CommentsModel(
      {this.id,
      this.commentableType,
      this.commentableId,
      this.comment,
      this.isApproved,
      this.userId,
      this.createdAt,
      this.updatedAt});

  CommentsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    commentableType = json['commentable_type'];
    commentableId = json['commentable_id'];
    comment = json['comment'];
    isApproved = json['is_approved'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['commentable_type'] = commentableType;
    data['commentable_id'] = commentableId;
    data['comment'] = comment;
    data['is_approved'] = isApproved;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
