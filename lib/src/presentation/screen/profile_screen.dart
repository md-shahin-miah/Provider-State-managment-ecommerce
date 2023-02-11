import 'package:flutter/material.dart';

import '../../../core/app_asset.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Image.asset(AppAsset.profilePic)),
          const Text(
            "Hello Shahin!",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppAsset.githubPic, width: 60),
                const SizedBox(width: 10),
                const Text(
                  "https://github.com/ShahinMohammad-insaneCoder",
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
