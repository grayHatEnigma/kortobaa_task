import 'package:flutter/material.dart';

import 'package:extended_image/extended_image.dart';

import '../widgets/no_image.dart';
import '../../models/post.dart';
import '../../constants.dart';

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({this.post});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: sizeUtil.width(25), vertical: sizeUtil.height(10)),
      padding: EdgeInsets.symmetric(
        vertical: sizeUtil.height(8),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[600],
            blurRadius: 0.75, // soften the shadow
            spreadRadius: 0.25, //extend the shadow
            offset: Offset(
              0.0, // Move to right horizontally
              2.0, // Move to bottom Vertically
            ),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildCardTop(context),
          sizeUtil.sizedBoxWithHeight(8),
          // image
          if (post.imageUrl != null)
            ExtendedImage.network(
              post.imageUrl,
              width: double.infinity,
              fit: BoxFit.contain,
              cache: false,
              loadStateChanged: (ExtendedImageState state) {
                switch (state.extendedImageLoadState) {
                  case LoadState.loading:
                    return Center(
                      child: SizedBox(
                          width: sizeUtil.width(20),
                          height: sizeUtil.height(20),
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          )),
                    );
                    break;
                  case LoadState.completed:
                    return state.completedWidget;
                    break;

                  default:
                    return NoImageWidget();
                }
              },
            ),
          if (post.imageUrl == null) NoImageWidget(),

          sizeUtil.sizedBoxWithHeight(8),
          Text(post.body),
        ],
      ),
    );
  }

  // Card Top
  Widget _buildCardTop(context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizeUtil.width(10.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // user info row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                child: post.userImageUrl == null
                    ? Icon(
                        Icons.account_circle,
                        color: Colors.white,
                        size: sizeUtil.size(20),
                      )
                    : Container(),
                backgroundColor: Colors.green,
                backgroundImage: post.userImageUrl != null
                    ? NetworkImage(post.userImageUrl)
                    : null,
              ),
              sizeUtil.sizedBoxWithWidth(5),
              Text(
                post.userName,
                style: TextStyle(
                  fontSize: sizeUtil.size(14),
                ),
              ),
            ],
          ),
          sizeUtil.sizedBoxWithWidth(5),
          // buttons row
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Icon(Icons.share,
                        size: sizeUtil.size(18), color: Colors.grey[600]),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Icon(Icons.turned_in,
                        size: sizeUtil.size(18), color: Colors.grey[600]),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Icon(Icons.favorite,
                        size: sizeUtil.size(18), color: Colors.grey[600]),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
