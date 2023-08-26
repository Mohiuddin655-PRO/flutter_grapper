import 'package:app_color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_androssy/core.dart';
import 'package:flutter_androssy/widgets.dart';

class NotificationFragment extends AndrossyFragment {
  const NotificationFragment({
    super.key,
    required super.instance,
  });

  @override
  Widget onCreate(context, instance) {
    return TextView(
      text: translate("Notification"),
      textColor: Colors.grey.t75,
      textSize: 32,
      gravity: Alignment.center,
    );
  }
}