import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stormflutterapp/generated/l10n.dart';
import 'package:stormflutterapp/provider/Notifier.dart';

import '../common/Global.dart';

/**
 * 主体换肤
 */
class ThemeChangeRoute extends StatelessWidget {
  const ThemeChangeRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(S.of(context).title_lens),
      ),
      body: ListView(
        children: Global.themes.map<Widget>((e) {
          return GestureDetector(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Container(
                color: e,
                height: 40,
              ),
            ),
            onTap: () {
              print("获取的e --> ${e}");
              Provider.of<ThemeModel>(context, listen: false).theme = e;
            },
          );
        }).toList(),
      ),
    );
  }
}
