import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stormflutterapp/generated/l10n.dart';
import 'package:stormflutterapp/provider/Notifier.dart';

class LanguageChangeRouter extends StatelessWidget {
  const LanguageChangeRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var localeModel = Provider.of<LocaleModel>(context);
    var color = Theme.of(context).primaryColor;


    Widget _buildLanguge(String lan, value) {

      print("locale -> ${localeModel.locale}   value --> $value" ); 
      return ListTile(
        title: Text(
          lan,
          style: TextStyle(color: localeModel.locale == value ? color : null,
          fontSize: 16),
        ),
        trailing: localeModel.locale == value
            ? Icon(
                Icons.done,
                color: color,
              )
            : null,
        onTap: () {
          localeModel.locale = value;
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(S.of(context).title_language),
      ),
      body: ListView(
        children: [
          _buildLanguge("中文简体", "zh_CN"),
          _buildLanguge("English", "en_US"),
        ],
      ),
    );
  }
}
