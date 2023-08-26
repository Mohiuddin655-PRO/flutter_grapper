import 'package:flutter/material.dart';
import 'package:flutter_androssy/core.dart';
import 'package:flutter_andomie/core.dart';
import 'package:flutter_androssy/widgets.dart';
import 'package:flutter_app_navigator/app_navigator.dart';

import '../../index.dart';

class SplashActivity extends AndrossyActivity with OnScreenLoaderMixin<String> {
  const SplashActivity({
    super.key,
  });

  @override
  Map<String, dynamic> init(BuildContext context) {
    return {
      "loader": ScreenLoader.getInstance<String>(
        context: context,
        mixin: this,
        loaders: [],
      ),
    };
  }

  @override
  AndrossyAppbarConfig appbarConfig(BuildContext context) {
    return const AndrossyAppbarConfig(
      backgroundColor: Colors.transparent,
      toolbarHeight: 0,
    );
  }

  @override
  StatusBarConfig statusBarConfig(
    BuildContext context,
    StatusBarConfig config,
  ) {
    return config.copyWith(color: Colors.transparent);
  }

  @override
  AndrossyScreenConfig config(BuildContext context) {
    return const AndrossyScreenConfig(
      extendBodyBehindAppBar: true,
      extendBody: true,
      resizeToAvoidBottomInset: false,
    );
  }

  @override
  Widget onCreate(context, theme, instance) {
    var a = theme.textTheme.titleLarge;
    var b = theme.textTheme.titleSmall;
    return SplashView(
      bodyY: 5,
      title: AppInfo.name,
      titleColor: a?.color,
      titleSize: a?.fontSize,
      subtitle: AppInfo.description,
      subtitleColor: b?.color,
      subtitleSize: b?.fontSize,
      subtitleWeight: FontWeight.w300,
      logo: LogoContent.logo,
      logoRadius: LogoContent.sizeRadiusLarge,
      logoSize: LogoContent.sizeLarge,
      onExecute: () {
        return instance.find<ScreenLoader>("loader").call();
      },
    );
  }

  @override
  void onDefault(BuildContext context) {
    AppNavigator.load(context, AppRoutes.home.route, flag: Flag.clear);
  }

  @override
  void onHold(ProviderEvent<String> event) {
    AppNavigator.load(event.context, event.value);
  }
}
