import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final Function onClick;

  const CustomDrawer({
    super.key,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Container(
      width: mediaQuery.width * 0.7,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: mediaQuery.width * 0.7,
            height: mediaQuery.height * 0.15,
            color: theme.primaryColor,
            child: const Text(
              "News App!",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              onClick();
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
              child: Row(
                children: [
                  Icon(
                    Icons.menu_rounded,
                    size: 35,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Categories",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
            child: Row(
              children: [
                Icon(
                  Icons.settings,
                  size: 35,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Settings",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
