class InfoModel {
  final String url;
  final String title;
  InfoModel.fromJson(Map<String, dynamic> json)
      : url = json['urls']['small'],
        title = json['id'];
}
