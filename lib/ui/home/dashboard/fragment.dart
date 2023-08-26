import 'package:app_color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_androssy/core.dart';
import 'package:flutter_androssy/widgets.dart';

class DashboardFragment extends AndrossyFragment {
  const DashboardFragment({
    super.key,
    required super.instance,
  });

  @override
  Widget onCreate(context, instance) {
    return TextView(
      text: translate("Home"),
      textColor: Colors.grey.t75,
      textSize: 32,
      gravity: Alignment.center,
      onClick: (context) {
        instance.setLocale(Locale(instance.isDefaultLanguage ? "bn" : "en"));
      },
    );
  }
}
