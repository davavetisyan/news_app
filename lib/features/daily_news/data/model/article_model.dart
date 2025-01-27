import 'package:floor/floor.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';


@Entity(tableName: 'article', primaryKeys: ['id'])
class ArticleModel extends ArticleEntity {
  const ArticleModel({
    super.id,
    super.author,
    super.title,
    super.description,
    super.url,
    super.urlToImage,
    super.publishedAt,
    super.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> map) {
    return ArticleModel(
      author: map['author'] ?? "",
      title: map['title'] ?? "",
      description: map['description'] ?? "",
      url: map['url'] ?? "",
      urlToImage: map['urlToImage '] ?? "",
      publishedAt: map['publishedAt'] ?? "",
      content: map[' content'] ?? "",
    );
  }

  factory ArticleModel.fromEntity(ArticleEntity article) {
    return ArticleModel(
      id: article.id, 
      author: article.author, 
      title: article.title,
      description: article.description, 
      url: article.url, 
      urlToImage: article.urlToImage, 
      publishedAt: article.publishedAt, 
      content: article.content, 
    );
  }
}
