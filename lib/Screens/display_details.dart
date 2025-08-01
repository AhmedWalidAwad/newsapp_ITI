import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/news_model.dart';

class DisplayDetails extends StatelessWidget {
  final NewsModel article;

  const DisplayDetails({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Details'),
        backgroundColor: Colors.cyanAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (article.image == null)
                Image.network(
                  'https://imgs.search.brave.com/eD5ySw12vVlrUgYMWctOXTuWzlDK8J2aIdfyz7ig7TA/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvMjE5/NDU4NjY2OS9waG90/by93YXNoaW5ndG9u/LWRjLXUtcy1wcmVz/aWRlbnQtZG9uYWxk/LXRydW1wLXRha2Vz/LWEtcXVlc3Rpb24t/ZnJvbS1hLXJlcG9y/dGVyLWR1cmluZy1h/LW5ld3MuanBnP3M9/NjEyeDYxMiZ3PTAm/az0yMCZjPUNoYlNZ/VDY3Z09OY3pxX2JE/OEh4cXBJRkNpSFR3/RDJ3UmIxazJ4RVVu/VWs9',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder:
                      (context, error, stackTrace) => Image.network(
                        'https://via.placeholder.com/200',
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(child: CircularProgressIndicator());
                  },
                )
              else
                Image.network(
                  'https://via.placeholder.com/200',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              const SizedBox(height: 10),
              Text(
                article.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Source: ${article.source.name}',
                style: const TextStyle(fontSize: 16, color: Colors.yellow),
              ),
              const SizedBox(height: 10),
              if (article.description != null &&
                  article.description!.isNotEmpty)
                Text(
                  article.description!,
                  style: const TextStyle(fontSize: 16),
                ),
              const SizedBox(height: 10),
              Text(
                'Published: ${article.publishedAt ?? 'N/A'}',
                style: const TextStyle(fontSize: 14, color: Colors.redAccent),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
