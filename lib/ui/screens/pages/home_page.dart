import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants.dart';
import '../../widgets/post_card.dart';
import '../../../blocs/page_bloc.dart';
import '../../../blocs/post_list/post_list_bloc.dart';
import '../../../models/post.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Change app bar title according to the current viewed tab,
    Provider.of<PageBloc>(context)..changePage(MyPage.home);

    // Start fetching posts feed from firestore
    BlocProvider.of<PostListBloc>(context)..add(FetchPosts());

    return BlocBuilder<PostListBloc, PostListState>(
      builder: (context, state) {
        if (state is PostListSuccess) {
          return PostsList(posts: state.posts);
        }
        if (state is PostListFailure) {
          return Center(
            child: Text(
              state.message,
              style: TextStyle(fontSize: sizeUtil.size(22), color: Colors.grey),
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
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
