import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {Key? key,
      required this.appBarTitle,
      this.isAttachBackground = true,
      this.elevation = 1.0})
      : super(key: key);

  final String? appBarTitle;
  final bool isAttachBackground;
  final double? elevation;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60.0);
}

class _CustomAppBarState extends State<CustomAppBar> {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(CupertinoIcons.left_chevron),
        onPressed: () {
          Get.back();
        },
      ),
      title: Text(
        widget.appBarTitle.toString(),
        style: const TextStyle(fontSize: 18, color: Colors.black),
      ),
      backgroundColor: widget.isAttachBackground ? Colors.white : Colors.transparent,
      elevation: widget.elevation,
    );
  }
}
