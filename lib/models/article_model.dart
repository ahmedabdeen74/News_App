class ArticleModel {
  final String? image;
  final String title;
  final String? subTitle;
  final String url;
  final Source sourceName;
  ArticleModel({required this.url,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.sourceName,});
  factory ArticleModel.fromjeson(json) {
    return ArticleModel(
      sourceName:Source.fromjeson(json['source']),
      url:json['url'],
      image: json['urlToImage'],
      title: json['title'],
      subTitle: json['description'],
    );
  }
}

class Source {
  final String sourceName;
  Source({required this.sourceName});
  factory Source.fromjeson(json){
    return Source(
      sourceName: json['name'],
      );
  }
}

