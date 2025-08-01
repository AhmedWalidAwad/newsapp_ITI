class NewsModel {
  final String title;
  final String? description;
  final String? content;
  final String url;
  final String? image;
  final String publishedAt;
  final Source source;

  NewsModel({
    required this.title,
    required this.description,
    this.content,
    required this.url,
    this.image,
    required this.publishedAt,
    required this.source,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'] ?? '',
      description: json['description'],
      content: json['content'],
      url: json['url'] ?? '',
      image: json['image'],
      publishedAt: json['publishedAt'] ?? '',
      source: Source.fromJson(json['source'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'content': content,
      'url': url,
      'image': image,
      'publishedAt': publishedAt,
      'source': source.toJson(),
    };
  }
}

class Source {
  final String name;
  final String url;

  Source({
    required this.name,
    required this.url,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      name: json['name'] ?? '',
      url: json['url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
    };
  }
}