class Currency {
  String name;
  String code;

  Currency({required this.name, required this.code,});

  Currency.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        code = json['code'];
}
