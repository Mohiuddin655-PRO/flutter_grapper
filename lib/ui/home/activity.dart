import 'package:app_color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_androssy/core.dart';
import 'package:flutter_androssy/services.dart';
import 'package:flutter_androssy/widgets.dart';
import 'package:flutter_app_navigator/app_navigator.dart';

import '../../index.dart';

class HomeActivity extends BaseActivity {
  const HomeActivity({
    super.key,
    super.title = "Home",
    super.elevation = 0,
  });

  @override
  AndrossyAppbarConfig appbarConfig(BuildContext context) {
    return AndrossyAppbarConfig(
      backgroundColor: AppColors.overlayColor.detect(instance.isDarkTheme),
      titleTextStyle: TextStyle(
        color: AppColors.textColor.detect(instance.isDarkTheme).t75,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness:
            instance.isDarkTheme ? Brightness.light : Brightness.dark,
        statusBarIconBrightness:
            instance.isDarkTheme ? Brightness.light : Brightness.dark,
        statusBarColor: Colors.transparent,
        systemNavigationBarColor:
            AppColors.overlayColor.detect(instance.isDarkTheme),
      ),
    );
  }

  @override
  List<Widget>? onCreateActions(BuildContext context) {
    return [
      PopupMenuButton<String>(
        tooltip: "", //Adding tooltip
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        onSelected: (v) {
          if (v.contains("settings")) {
            _onSettings(context);
          }
        },
        itemBuilder: (context) => [
          const PopupMenuItem(
            value: "settings",
            child: Text("Settings"),
          ),
        ],
      ),
    ];
  }

  @override
  Widget onCreate(context, theme, instance) {
    return NavigationView(
      onIndexChanged: instance.setNavigationIndex,
      currentIndex: instance.index,
      positionType: ViewPositionType.bottom,
      paddingVertical: 12,
      background: AppColors.overlayColor.detect(instance.isDarkTheme),
      spaceBetween: 8,
      titleColorState: ValueState(
        primary: AppColors.iconColor.detect(instance.isDarkTheme).t50,
        secondary: AppColors.primary.detect(instance.isDarkTheme),
      ),
      iconTintState: ValueState(
        primary: AppColors.iconColor.detect(instance.isDarkTheme).t50,
        secondary: AppColors.primary.detect(instance.isDarkTheme),
      ),
      items: [
        NavigationItem(
          title: translate("Home"),
          iconState: const ValueState(
            primary: Icons.home_outlined,
            secondary: Icons.home,
          ),
        ),
        NavigationItem(
          title: translate("Notification"),
          iconState: const ValueState(
            primary: Icons.notifications_outlined,
            secondary: Icons.notifications,
          ),
        ),
        NavigationItem(
          title: translate("Profile"),
          iconState: const ValueState(
            primary: Icons.person_outline,
            secondary: Icons.person,
          ),
        ),
      ],
      builder: (context, index) {
        if (index == 1) {
          return NotificationFragment(
            instance: instance,
          );
        } else if (index == 2) {
          return ProfileFragment(
            instance: instance,
          );
        } else {
          return DashboardFragment(
            instance: instance,
          );
        }
      },
    );
  }

  void _onSettings(BuildContext context) => AppNavigator.load(
        context,
        AppRoutes.settings.route,
      );
}
