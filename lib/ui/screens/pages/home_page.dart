import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utilities/device_info_utility.dart';
import '../../widgets/post_card.dart';
import '../../../blocs/page_bloc.dart';
import '../../../models/post.dart';

class HomePage extends StatelessWidget {
  void testInfo() async {
    print('testing info ...');
    String id = await DeviceInfo.getId();
    print('Device Id : $id');
  }

  @override
  Widget build(BuildContext context) {
    // Change app bar title according to the current viewed tab,
    Provider.of<PageBloc>(context)..changePage(MyPage.home);

    // Device Info Test
    testInfo();

    // Firebase Test
    FirebaseFirestore.instance.collection('posts').snapshots().listen((event) {
      print(event.docs.first.data());
    });
    return PostsList(posts: [
      Post(
          body: 'Treka ❤️',
          imageUrl: 'assets/images/posts/treka.jpg',
          userName: 'grayHatEnigma',
          postId: '0',
          userId: '0'),
      Post(
          body: 'Hey There! Code Clean!',
          imageUrl: 'assets/images/posts/uncle_bob.jpg',
          userName: 'grayHatEnigma',
          postId: '0',
          userId: '0'),
      Post(
          body: 'Sunset is beautiful! ❤️',
          imageUrl: 'assets/images/posts/sunset.jpeg',
          userName: 'grayHatEnigma',
          postId: '0',
          userId: '0'),
    ]);
  }
}

class PostsList extends StatelessWidget {
  final List<Post> posts;

  const PostsList({this.posts});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return PostCard(post: posts[index]);
        });
  }
}
