class PostModel {
  final String pid;
  final String moodDescription;
  final String moodIcon;
  final String createdDate;

  PostModel({
    required this.pid,
    required this.moodDescription,
    required this.moodIcon,
    required this.createdDate,
  });

  PostModel.empty()
      : pid = "",
        moodDescription = "",
        moodIcon = "",
        createdDate = "";

  PostModel.fromJson({required Map<String, dynamic> json})
      : pid = json["pid"],
        moodDescription = json["moodDescription"],
        moodIcon = json["moodIcon"],
        createdDate = json["createdDate"];

  Map<String, dynamic> toJson() {
    return {
      "pid": pid,
      "moodDescription": moodDescription,
      "moodIcon": moodIcon,
      "createdDate": createdDate,
    };
  }
}
