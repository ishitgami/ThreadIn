import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thread_in/logic/cubit/news_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<NewsCubit>(context).fetchNEWS();
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            if (state is! NewsLoaded) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final news = state.news;
            return ListView.builder(
              itemCount: news.articles?.length,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.white,
                  margin: const EdgeInsets.all(5),
                  child: Column(
                    children: [
                       (news.articles![index].urlToImage.toString() == 'null') ? 
                        Container(
                          child: const Text('No Image'),
                        )
                      :
                      Image.network(news.articles![index].urlToImage.toString())
                    ],
                  ),
                  // child: ListTile(
                  //   // leading: Text(news.articles![index].author.toString()),
                  //   // trailing: Text(news.articles![index].content.toString()),
                  //   title: Text(news.articles![index].title.toString()),
                  //   //   subtitle: Text(news[index].address!.street! +
                  //   //       ', ' +
                  //   //       users[index].address!.city!),
                  //   // ),
                  // ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
