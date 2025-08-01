import 'package:flutter/material.dart';
import 'package:flutter_application_2/cubites/news_cubit/news_cubit.dart';
import 'package:flutter_application_2/widgets/ticker_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_2/widgets/news_widget.dart';

class DisplayNewsScreen extends StatelessWidget {
  const DisplayNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              NewsCubit()
                ..fetchTopHeadlines(lang: 'en', country: 'us', max: 20),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Top Headlines'),
          backgroundColor: Colors.cyanAccent,
          actions: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/me.jpg',
                        fit: BoxFit.cover,
                        width: 60,
                        height: 60,
                        errorBuilder:
                            (context, error, stackTrace) =>
                                const Icon(Icons.error),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  const Text(
                    "Hello, Ahmed",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 60),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      border: Border.all(style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(7),
                      boxShadow: const [BoxShadow(blurRadius: 3)],
                    ),
                    child: const Icon(Icons.search, color: Colors.black),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      border: Border.all(style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: const [BoxShadow(blurRadius: 3)],
                    ),
                    child: const Icon(Icons.settings, color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            const Ticker(),
            Expanded(
              child: BlocBuilder<NewsCubit, NewsState>(
                builder: (context, state) {
                  if (state is NewsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is NewsSuccess) {
                    final articles = state.articles;
                    if (articles.isEmpty) {
                      return const Center(child: Text('No articles found'));
                    }
                    return ListView.builder(
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        return NewsWidget(article: articles[index]);
                      },
                    );
                  } else if (state is NewsError) {
                    return Center(child: Text('Error: ${state.error}'));
                  }
                  return const Center(child: Text('No data available'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
