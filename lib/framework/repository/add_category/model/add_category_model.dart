class AddCategoryModel {
  String? message;
  int? status;

  AddCategoryModel({
    this.message,
    this.status,
  });

  factory AddCategoryModel.fromJson(Map<String, dynamic> json) => AddCategoryModel(
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
  };
}
