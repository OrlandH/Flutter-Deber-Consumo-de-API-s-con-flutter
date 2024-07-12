class CatF {
  final String text;

  CatF({required this.text});

  factory CatF.fromJson(Map<String, dynamic> json) {
    return CatF(
      text: json['text'],
    );
  }
}
