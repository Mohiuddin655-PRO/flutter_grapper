import 'package:flutter/material.dart';
import 'package:flutter_androssy/core.dart';
import 'package:flutter_androssy/extensions.dart';
import 'package:flutter_androssy/widgets.dart';

import '../../index.dart';

class SettingsActivity extends BaseActivity {
  const SettingsActivity({
    super.key,
    super.hideToolbar = true,
  });

  @override
  AndrossyScreenConfig config(BuildContext context) {
    return super.config(context).copyWith(
          backgroundColor: instance.isDarkTheme ? Colors.black : Colors.white,
        );
  }

  @override
  Widget onCreate(context, theme, instance) {
    return const GraphView(
      width: double.infinity,
      height: double.infinity,
      child: LinearLayout(
        width: double.infinity,
        paddingHorizontal: 24,
        children: [
          TextView(
            text: "Settings",
            textSize: 40,
            textFontWeight: FontWeight.w500,
            marginTop: 24,
          ),
          SettingButton(
            title: "Language",
            icon: Icons.settings,
            iconColor: Color(0xFFF67303),
          ),
          SettingButton(
            title: "Notification",
            icon: Icons.notifications,
            iconColor: Color(0xFF029DE6),
            iconBackground: Color(0xFFF7EDE6),
          ),
          SettingButton(
            title: "Dark Mode",
            icon: Icons.dark_mode,
            iconColor: Color(0xFF6828F7),
          ),
          SettingButton(
            title: "Help",
            icon: Icons.help,
            iconColor: Color(0xFFF32252),
          ),
        ],
      ),
    );
  }
}

class SettingButton extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final double? titleSize;
  final String? subtitle;
  final Color? subtitleColor;
  final double? subtitleSize;
  final dynamic icon;
  final Color? iconColor;
  final Color? iconBackground;

  const SettingButton({
    super.key,
    required this.title,
    this.titleColor,
    this.titleSize,
    this.subtitle,
    this.subtitleColor,
    this.subtitleSize,
    this.icon,
    this.iconColor,
    this.iconBackground,
  });

  @override
  Widget build(BuildContext context) {
    var mIC = iconColor ?? context.primaryColor;
    return LinearLayout(
      orientation: Axis.horizontal,
      crossGravity: CrossAxisAlignment.center,
      children: [
        IconView(
          icon: icon,
          background: iconBackground ?? mIC.withOpacity(0.12),
          borderRadius: 25,
          padding: 8,
          tint: mIC,
        ),
        TextView(
          marginStart: 16,
          text: title,
          textSize: 18,
          textColor: Colors.black,
          flex: 1,
        ),
      ],
    );
  }
}
