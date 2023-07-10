class ChatModel {
  int type = 0;
  String message = "";
  bool isSelected = false;

  ChatModel(
      {required this.type, required this.message, required this.isSelected});

  ChatModel.fromJson(Map<String, dynamic> json) {
    if (json["type"] is int) {
      type = json["type"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["isSelected"] is bool) {
      isSelected = json["isSelected"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["type"] = type;
    _data["message"] = message;
    _data["isSelected"] = isSelected;
    return _data;
  }
}
