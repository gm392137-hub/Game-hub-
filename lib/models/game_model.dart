class Game {
  final int id;
  final String title;
  final String description;
  final String category;
  final double rating;
  final String imageUrl;
  final double price;
  final int downloads;
  final String developer;
  final String version;
  final String releaseDate;
  final String size;

  Game({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.rating,
    required this.imageUrl,
    required this.price,
    required this.downloads,
    required this.developer,
    required this.version,
    required this.releaseDate,
    required this.size,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      rating: json['rating'].toDouble(),
      imageUrl: json['imageUrl'],
      price: json['price'].toDouble(),
      downloads: json['downloads'],
      developer: json['developer'],
      version: json['version'],
      releaseDate: json['releaseDate'],
      size: json['size'],
    );
  }
}