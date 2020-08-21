import 'package:flutter/material.dart';
import 'package:kortobaa_task/models/post.dart';
import '../../constants.dart';

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({this.post});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      margin: EdgeInsets.symmetric(
          horizontal: sizeUtil.width(25), vertical: sizeUtil.height(10)),
      padding: EdgeInsets.symmetric(
        vertical: sizeUtil.height(8),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Theme.of(context).primaryColor,
        ),
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
          Expanded(
              child: Image.asset(
            post.imageUrl,
            width: double.infinity,
            fit: BoxFit.fill,
          )),
          sizeUtil.sizedBoxWithHeight(8),
          Text(post.userName),
        ],
      ),
    );
  }

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
                child: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                  size: sizeUtil.size(27),
                ),
                backgroundColor: Colors.green,
              ),
              sizeUtil.sizedBoxWithWidth(8),
              Text(post.userName),
            ],
          ),
          // buttons row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {},
                child: Icon(Icons.share, color: Colors.grey[600]),
              ),
              sizeUtil.sizedBoxWithWidth(15),
              InkWell(
                onTap: () {},
                child: Icon(Icons.turned_in, color: Colors.grey[600]),
              ),
              sizeUtil.sizedBoxWithWidth(15),
              InkWell(
                onTap: () {},
                child: Icon(Icons.favorite, color: Colors.grey[600]),
              ),
            ],
          )
        ],
      ),
    );
  }
}
