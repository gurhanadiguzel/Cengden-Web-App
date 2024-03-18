import 'package:flutter/material.dart';

class CengdenAppBar extends StatelessWidget {
  const CengdenAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      width: size.width,
      height: size.height * 0.2,
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 40,
            height: 40,
          ),
          Container(
            width: 350,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                'https://raw.githubusercontent.com/gurhanadiguzel/Flutter-Projects/main/images/cengden.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: 60,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(size.width * 0.01), // 1% of the screen width
              child: Image.network(
                'https://raw.githubusercontent.com/gurhanadiguzel/Flutter-Projects/main/images/ceng.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
