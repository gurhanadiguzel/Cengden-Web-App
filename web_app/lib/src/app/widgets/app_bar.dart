import 'package:flutter/material.dart';

class CengdenAppBar extends StatelessWidget {
  const CengdenAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 30,
            height: 30,
          ),
          Container(
            height: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'images/cengden.png',
              ),
            ),
          ),
          Container(
            height: 80,
            child: ClipRRect(
              child: Image.asset(
                'images/ceng.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
