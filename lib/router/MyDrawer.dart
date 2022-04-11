import 'package:flutter/material.dart';
import 'package:list_tile_more_customizable/list_tile_more_customizable.dart';
import 'package:provider/provider.dart';
import 'package:stormflutterapp/provider/Notifier.dart';
import 'package:stormflutterapp/router/HomeRouter.dart';

import '../generated/l10n.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_buildHeaders(), Expanded(child: _buildMenus())],
          )),
    );
  }

  Widget _buildHeaders() {


    return Consumer<UserModel>(
        builder: (BuildContext context, UserModel value, Widget? child) {
      print("用户信息 --> " + value.user.toString());

      return GestureDetector(
        child: Container(
          color: Theme.of(context).primaryColor,
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
                Text(
                  value.isLogin
                      ? (value.user!.name ?? "无名")
                      : S.of(context).login,
                  style: const TextStyle(color: Colors.white),


                )
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.of(context).pushNamed('login');
        },
      );
    });
  }

  Widget _buildMenus() {
    return Consumer(
        builder: (BuildContext context, UserModel value, Widget? child) {
      return ListView(
        children: [
          ListTileMoreCustomizable(
            dense: true,
            leading: const Icon(Icons.color_lens,),
            title: Text(
              S.of(context).title_lens,
              style: const TextStyle(color: Colors.grey),
            ),
            onTap: (v) {
              // 跳转 换肤
              Navigator.of(context).pushNamed("theme");
            },
          ),
          Container(
            color: Colors.red,
            child: ListTileMoreCustomizable(
              leading: const Icon(Icons.language),
              title: Text(
                S.of(context).title_language,
                style: const TextStyle(color: Colors.grey),
              ),
              onTap: (v) {
                Navigator.of(context).pushNamed("language");
              },
            ),
          )
        ],
      );
    });
  }
}
