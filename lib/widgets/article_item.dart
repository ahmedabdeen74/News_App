import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helper/constant.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/views/web_view.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({
    super.key, required this.article,
  });
  final  ArticleModel article;
  final String placeHolderImage = 'assets/business.jpg';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return WebViewPage(article: article.url);
          }));
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: article.image ?? placeHolderImage,
                placeholder: (context, url) => Container(
                    height: 200,
                    width: double.infinity,
                    child: const Center(child: CircularProgressIndicator())),
                errorWidget: (context, url, error) => Container(
                  color: kGrey300Color,
                  height: 200,
                  width: double.infinity,
                  child: const Center(
                    child: Icon(
                      Icons.hide_image_outlined,
                      size: 70,
                    ),
                  ),
                ),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              article.title,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              article.subTitle ?? '',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
              maxLines: 2,
            ),
            const SizedBox(
              height: 3,
            ),
            /*
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  'News source : ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  article.sourceName.toString(),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            )*/
          ],
        ),
      ),
    );
  }
}
