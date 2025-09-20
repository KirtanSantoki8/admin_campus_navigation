class AllCategoriesModel {
  List<List<dynamic>>? message;
  int? status;

  AllCategoriesModel({
    this.message,
    this.status,
  });

  factory AllCategoriesModel.fromJson(Map<String, dynamic> json) => AllCategoriesModel(
    message: json["message"] == null ? [] : List<List<dynamic>>.from(json["message"]!.map((x) => List<dynamic>.from(x.map((x) => x)))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "message": message == null ? [] : List<dynamic>.from(message!.map((x) => List<dynamic>.from(x.map((x) => x)))),
    "status": status,
  };
}
