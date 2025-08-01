import 'package:flutter/material.dart';
import 'package:flutter_application_2/cubites/news_cubit/news_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Ticker extends StatelessWidget {
  const Ticker({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: Colors.grey[200],
      child: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          if (state is NewsSuccess && state.articles.isNotEmpty) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.articles.length,
              itemBuilder: (context, index) {
                final article = state.articles[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    article.title,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}