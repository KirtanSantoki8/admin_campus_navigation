class DashboardModel {
  List<List<dynamic>>? categoryWiseSubLocationData;
  int? locationCount;
  int? status;
  int? subLocationCount;

  DashboardModel({
    this.categoryWiseSubLocationData,
    this.locationCount,
    this.status,
    this.subLocationCount,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
    categoryWiseSubLocationData: json["category_wise_sub_location_data"] == null ? [] : List<List<dynamic>>.from(json["category_wise_sub_location_data"]!.map((x) => List<dynamic>.from(x.map((x) => x)))),
    locationCount: json["location_count"],
    status: json["status"],
    subLocationCount: json["sub_location_count"],
  );

  Map<String, dynamic> toJson() => {
    "category_wise_sub_location_data": categoryWiseSubLocationData == null ? [] : List<dynamic>.from(categoryWiseSubLocationData!.map((x) => List<dynamic>.from(x.map((x) => x)))),
    "location_count": locationCount,
    "status": status,
    "sub_location_count": subLocationCount,
  };
}
