import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stormflutterapp/provider/Notifier.dart';
import 'package:stormflutterapp/router/HomeRouter.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeaders(),
            ],
          )),
    );
  }

  Widget _buildHeaders() {
    return Consumer<UserModel>(
        builder: (BuildContext context, UserModel value, Widget? child) {
      return GestureDetector(
        child: Container(
          color: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0, bottom: 20),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ClipOval(
                      child: value.isLogin
                          ? gmAvatar(value.user!.avatar_url, width: 80)
                          : Image.asset(
                              "images/ic_header_default.png",
                              width: 80,
                            )),
                ),
              ],
            ),
          ),
        ),
        onTap: () {},
      );
    });
  }
}
