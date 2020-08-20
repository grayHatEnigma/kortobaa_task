import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/post_card.dart';
import '../../../blocs/title_bloc.dart';
import '../../../models/post.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Change app bar title according to the current viewed tab,
    final titleBloc = Provider.of<TitleBloc>(context);
    titleBloc.changeTitle(AppTitle.home);
    return PostsList(posts: [
      Post(
          text: 'Treka ❤️',
          image: Image.asset(
            'assets/images/posts/treka.jpg',
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          postId: 0,
          userId: 0),
      Post(
          text: 'Hey There! Code Clean!',
          image: Image.asset(
            'assets/images/posts/uncle_bob.jpg',
            fit: BoxFit.fill,
            width: double.infinity,
          ),
          postId: 0,
          userId: 0),
      Post(
          text: 'Sunset is beautiful! ❤️',
          image: Image.asset(
            'assets/images/posts/sunset.jpeg',
            fit: BoxFit.fill,
            width: double.infinity,
          ),
          postId: 0,
          userId: 0),
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
