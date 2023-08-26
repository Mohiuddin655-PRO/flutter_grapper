import 'package:flutter/material.dart';
import 'package:flutter_androssy/core.dart';

import '../../index.dart';

class HomeActivity extends BaseActivity {
  const HomeActivity({
    super.key,
    super.hideToolbar = true,
  });

  @override
  AndrossyAppbarConfig appbarConfig(BuildContext context) {
    return const AndrossyAppbarConfig(
      backgroundColor: Colors.transparent,
      toolbarHeight: 0,
    );
  }

  @override
  AndrossyScreenConfig config(BuildContext context) {
    return const AndrossyScreenConfig(
      extendBody: true,
      extendBodyBehindAppBar: true,
    );
  }

  @override
  Widget onCreate(context, theme, instance) {
    return HomeLayout(
      isDarkMode: instance.isDarkTheme,
    );
  }
}
