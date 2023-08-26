import 'dart:io';

import 'package:app_color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_androssy/services.dart';
import 'package:flutter_androssy/widgets.dart';
import 'package:graphy/core/index.dart';
import 'package:image_picker/image_picker.dart';

class HomeLayout extends StatefulWidget {
  final bool isDarkMode;
  const HomeLayout({
    super.key, required this.isDarkMode,
  });

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  bool showGrid = false;
  File? file;
  ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return StackLayout(
      width: double.infinity,
      height: double.infinity,
      children: [
        GraphView(
          behindMode: false,
          showGraph: showGrid,
          toggle: false,
          child: ImageView(
            width: file != null ? double.infinity : 200,
            height: file != null ? double.infinity : 200,
            background: Colors.grey.withAlpha(50),
            image: file,
            placeholder: "assets/images/img_placeholder.png",
          ),
        ),
        LinearLayout(
          orientation: Axis.horizontal,
          positionType: ViewPositionType.bottomFlex,
          paddingVertical: 24,
          paddingHorizontal: 24,
          crossGravity: CrossAxisAlignment.center,
          children: [
            LinearLayout(
              flex: 1,
              gravity: Alignment.center,
              layoutGravity: LayoutGravity.center,
              children: [
                IconView(
                  icon: Icons.grid_3x3_outlined,
                  tint: AppColors.iconColor.detect(widget.isDarkMode),
                  borderRadius: 50,
                  background: Colors.black,
                  padding: 12,
                  onClick: _onShowGrid,
                )
              ],
            ),
            LinearLayout(
              flex: 1,
              gravity: Alignment.center,
              layoutGravity: LayoutGravity.center,
              children: [
                IconView(
                  icon: Icons.photo_camera_back_outlined,
                  tint: AppColors.iconColor.detect(widget.isDarkMode),
                  background: Colors.black,
                  borderRadius: 50,
                  padding: 12,
                  onClick: _onChoose,
                )
              ],
            ),
            LinearLayout(
              flex: 1,
              gravity: Alignment.center,
              layoutGravity: LayoutGravity.center,
              children: [
                IconView(
                  icon: Icons.clear,
                  tint: AppColors.iconColor.detect(widget.isDarkMode),
                  borderRadius: 50,
                  background: Colors.black,
                  padding: 12,
                  onClick: _onClear,
                )
              ],
            ),
          ],
        ),
      ],
    );
  }

  void _onShowGrid(BuildContext context) {
    setState(() {
      showGrid = !showGrid;
    });
  }

  void _onChoose(BuildContext context) async {
    var img = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      file = File(img!.path);
    });
  }

  void _onClear(BuildContext context) {
    setState(() {
      file = null;
    });
  }
}
