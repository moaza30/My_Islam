class AzkarModel {
  final int? id;
  final String? title;
  final String? audioUrl;

  AzkarModel({this.id, this.title, this.audioUrl});

  factory AzkarModel.fromJson(Map<String, dynamic> data) {
    return AzkarModel(
      id: data["ID"],
      title: data["TITLE"],
      audioUrl: data["AUDIO_URL"],
    );
  }
}
