class AllCategoriesNoDataModel {
  String? message;
  int? status;

  AllCategoriesNoDataModel({
    this.message,
    this.status,
  });

  factory AllCategoriesNoDataModel.fromJson(Map<String, dynamic> json) => AllCategoriesNoDataModel(
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
  };
}
