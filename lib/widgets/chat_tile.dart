import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 10,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/image_shop_logo.png',
                width: 54,
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shoe Store',
                      style: primaryTextStyle.copyWith(fontSize: 15),
                    ),
                    Text(
                      'Good night, This item is on the way',
                      style: secondaryTextStyle.copyWith(fontWeight: light),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Now',
                style: secondaryTextStyle.copyWith(fontSize: 10),
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Divider(
            thickness: 1,
            color: Color(0xff2B2939),
          )
        ],
      ),
    );
  }
}
