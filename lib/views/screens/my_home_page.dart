import 'package:flutter/material.dart';

import '../../models/network_manager.dart';
import '../../models/post_data.dart';
import '../widgets/news_tile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<Results> futurePosts;
  NetworkManager networkManager = NetworkManager();

  @override
  void initState() {
    super.initState();
    futurePosts = networkManager.fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
        title: const Text(
          'Tech News',
          style: TextStyle(fontFamily: 'DMSerifDisplay'),
        ),
      ),
      body: FutureBuilder(
              future: futurePosts,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.hits.length,
                    itemBuilder: (context, index) {
                      return NewsTile(
                        points: snapshot.data!.hits[index].points,
                        title: snapshot.data!.hits[index].title,
                        url: snapshot.data!.hits[index].url,
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('error: ${snapshot.error}');
                }
                return const Center(child: CircularProgressIndicator());
              }),
    );
  }
}
