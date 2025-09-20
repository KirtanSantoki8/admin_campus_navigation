class AllCategoriesModel {
  final int? status;
  final String? messageText;
  final List<List<dynamic>>? messageList;

  AllCategoriesModel({
    this.status,
    this.messageText,
    this.messageList,
  });

  factory AllCategoriesModel.fromJson(Map<String, dynamic> json) {
    final rawMessage = json['message'];

    if (rawMessage is String) {
      return AllCategoriesModel(
        status: json['status'],
        messageText: rawMessage,
        messageList: [],
      );
    } else if (rawMessage is List) {
      return AllCategoriesModel(
        status: json['status'],
        messageList: rawMessage
            .map<List<dynamic>>((item) => List<dynamic>.from(item))
            .toList(),
      );
    } else {
      return AllCategoriesModel(
        status: json['status'],
        messageList: [],
      );
    }
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": messageList?.isNotEmpty == true
        ? List<dynamic>.from(
        messageList!.map((x) => List<dynamic>.from(x)))
        : messageText,
  };
}
