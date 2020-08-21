import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/post_card.dart';
import '../../../blocs/page_bloc.dart';
import '../../../models/post.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Change app bar title according to the current viewed tab,
    Provider.of<PageBloc>(context)..changePage(MyPage.home);
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
