import 'package:flutter/material.dart';
import 'package:flutter_application_2/Screens/display_details.dart';
import 'package:flutter_application_2/models/news_model.dart';

class NewsWidget extends StatelessWidget {
  final NewsModel article;

  const NewsWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      elevation: 2,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => DisplayDetails(article: article)),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 100, // تحديد عرض ثابت للصورة
                height: 100, // تحديد ارتفاع ثابت للصورة
                child:
                    article.image == null
                        ? Image.network(
                          'https://imgs.search.brave.com/eD5ySw12vVlrUgYMWctOXTuWzlDK8J2aIdfyz7ig7TA/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvMjE5/NDU4NjY2OS9waG90/by93YXNoaW5ndG9u/LWRjLXUtcy1wcmVz/aWRlbnQtZG9uYWxk/LXRydW1wLXRha2Vz/LWEtcXVlc3Rpb24t/ZnJvbS1hLXJlcG9y/dGVyLWR1cmluZy1h/LW5ld3MuanBnP3M9/NjEyeDYxMiZ3PTAm/az0yMCZjPUNoYlNZ/VDY3Z09OY3pxX2JE/OEh4cXBJRkNpSFR3/RDJ3UmIxazJ4RVVu/VWs9',
                          fit: BoxFit.cover, // ضبط الصورة لتناسب المساحة
                          errorBuilder:
                              (context, error, stackTrace) =>
                                  const Icon(Icons.error),
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const CircularProgressIndicator();
                          },
                        )
                        : const Icon(Icons.image, size: 50),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      article.source.name,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    if (article.description != null)
                      Text(
                        article.description!,
                        style: const TextStyle(fontSize: 12),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
