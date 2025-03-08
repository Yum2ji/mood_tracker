class PostModel {
  final String moodDescription;
  final String moodIcon;
  final String createdDate;

  PostModel({
    required this.moodDescription,
    required this.moodIcon,
    required this.createdDate,
  });

  PostModel.empty()
      : moodDescription = "",
        moodIcon = "",
        createdDate = "";

  PostModel.fromJson({required Map<String, dynamic> json})
      : moodDescription = json["moodDescription"],
        moodIcon = json["moodIcon"],
        createdDate = json["createdDate"];

  Map<String, dynamic> toJson() {
    return {
      "moodDescription": moodDescription,
      "moodIcon": moodIcon,
      "createdDate": createdDate,
    };
  }
}
