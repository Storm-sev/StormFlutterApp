// models
import 'package:flutter/material.dart';
import 'package:stormflutterapp/common/ThemeColor.dart';
import 'package:stormflutterapp/models/user.dart';

import '../common/Global.dart';
import '../models/profile.dart';

class ProfileChangeNotifier extends ChangeNotifier {
  Profile get _profile => Global.profile;

  @override
  void notifyListeners() {
    Global.saveProfile();
    super.notifyListeners();
  }
}

class UserModel extends ProfileChangeNotifier {
  User? get user => _profile.user;

  // APP是否登录(如果有用户信息，则证明登录过)
  bool get isLogin => user != null;

  //用户信息发生变化，更新用户信息并通知依赖它的子孙Widgets更新
  set user(User? user) {
    if (user?.login != _profile.user?.login) {
      _profile.lastLogin = _profile.user?.login;
      _profile.user = user;
      notifyListeners();
    }
  }
// User? get user => _profile.user;
//
// bool get isLogin => user != null;
//
// set user(User user) {
//   if (user?.login != _profile.lastLogin) {
//     _profile.lastLogin = _profile.user?.login;
//     _profile.user = user;
//     notifyListeners();
//   }
// }
}

class ThemeModel extends ProfileChangeNotifier {
  ColorSwatch get theme =>
      Global.themes.firstWhere((element) => _profile.theme == element.value,
          orElse: () => Colors.blue);

  set theme(ColorSwatch? color) {
    if (null == color) return;
    if (theme != color) {
      _profile.theme = color[500]!.value;
      print("获取的主题颜色 ${_profile.theme}");
      notifyListeners();
    }
  }

  int get curIndex {
    int index = Global.themes.indexOf(theme as MaterialColor);
    print("获取的index--> $index");
    return index;
  }

  CustomTheme get curTheme {
    return custThemes[curIndex];
  }
}

class LocaleModel extends ProfileChangeNotifier {
  Locale? getLocale() {
    if (_profile.locale == null) {
      return null;
    }
    var t = _profile.locale!.split("_");
    return Locale(t[0], t[1]);
  }

  String? get locale => _profile.locale;

  set locale(String? locale) {
    if (null == locale) return;
    if (locale != _profile.locale) {
      _profile.locale = locale;
      notifyListeners();
    }
  }
}
