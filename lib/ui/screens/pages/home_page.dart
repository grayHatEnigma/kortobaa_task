import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../widgets/post_card.dart';
import '../../../managers/page_manager.dart';
import '../../../managers/post_list/post_list_manager.dart';
import '../../../models/post.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //                                      <-- fetch posts / change page
    _postBuildLogic(context);

    final postsManager =
        Provider.of<PostListManager>(context); //          <-- posts manager

    return StateNotifierBuilder<PostListState>(
        builder: (_, state, __) {
          return (state is PostListSuccess)
              ? PostsList(posts: state.posts)
              : (state is PostListFailure)
                  ? Center(
                      child: Text(
                        state.message,
                        style: TextStyle(
                            fontSize: sizeUtil.size(22), color: Colors.grey),
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    );
        },
        stateNotifier: postsManager);
  }

  void _postBuildLogic(context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<PageManager>(context, listen: false).changePage(MyPage.home);
      Provider.of<PostListManager>(context, listen: false).fetchPosts();
    });
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
