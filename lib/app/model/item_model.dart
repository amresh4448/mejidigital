class Item {
  final String title;
  final String subtitle;
  final String image;

  Item({required this.title, required this.subtitle, required this.image});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      title: json['title'],
      subtitle: json['subtitle'],
      image: json['image'],
    );
  }
}
