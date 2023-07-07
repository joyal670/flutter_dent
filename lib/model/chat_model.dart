class ChatModel {
  int type = 0;
  String message = "";

  ChatModel({required this.type, required this.message});

  ChatModel.fromJson(Map<String, dynamic> json) {
    if (json["type"] is int) {
      type = json["type"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["type"] = type;
    _data["message"] = message;
    return _data;
  }
}
