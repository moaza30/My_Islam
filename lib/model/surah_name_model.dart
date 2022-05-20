class QuranModel {
  final String? name;
  final String? englishName;
  final int? numberOfAyahs;

  QuranModel({
    this.name,
    this.englishName,
    this.numberOfAyahs,
  });

  factory QuranModel.fromJson(Map<String, dynamic> data) {
    return QuranModel(
      name: data["name"],
      englishName: data["englishName"],
      numberOfAyahs: data["numberOfAyahs"],
    );
  }
}
