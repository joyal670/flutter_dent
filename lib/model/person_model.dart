class PersonModel {
  int messageCount = 0;
  String name = "";
  bool isSelected = false;

  PersonModel(
      {required this.messageCount,
      required this.name,
      required this.isSelected});

  PersonModel.fromJson(Map<String, dynamic> json) {
    if (json["messageCount"] is int) {
      messageCount = json["messageCount"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["isSelected"] is bool) {
      isSelected = json["isSelected"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["messageCount"] = messageCount;
    _data["name"] = name;
    _data["isSelected"] = isSelected;
    return _data;
  }
}
