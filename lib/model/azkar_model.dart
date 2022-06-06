class AzkarDetailsModel {
  final String? arText;
  final String? enText;

  AzkarDetailsModel({this.arText, this.enText});

  factory AzkarDetailsModel.fromJson(Map<String, dynamic> data) {
    return AzkarDetailsModel(
      arText: data["ARABIC_TEXT"],
      enText: data["TRANSLATED_TEXT"],
    );
  }
}
