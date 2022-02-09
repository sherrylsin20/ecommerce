class Item {
  final String keyword;
  final int page;

  Item({required this.keyword, required this.page});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      keyword: json['keyword'],
      page: json['page'],
    );
  }
}