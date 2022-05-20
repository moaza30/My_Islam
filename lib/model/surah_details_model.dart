class SurahDetailsModel {
  final int? number;
  final String? text;
  final String? audioUrl;

  SurahDetailsModel({this.text, this.number, this.audioUrl});

  factory SurahDetailsModel.fromJson(Map<String, dynamic> data) {
    return SurahDetailsModel(
      number: data["numberInSurah"],
      text: data["text"],
      audioUrl: data["audio"],
    );
  }
}
