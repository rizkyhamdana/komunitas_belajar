import 'package:flutter/material.dart';
import 'package:komunitas_belajar/config/util/app_theme.dart';
import 'package:komunitas_belajar/config/util/custom_widget.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.context,
    this.title,
    this.backgroundColor,
    this.onPressed,
    this.centerTitle = true,
    this.actions,
  }) : preferredSize = const Size.fromHeight(56.0);

  @override
  final Size preferredSize;
  final BuildContext? context;
  final String? title;
  final Color? backgroundColor;
  final bool centerTitle;
  final void Function()? onPressed;
  final List<Widget>? actions;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 120,
      backgroundColor: widget.backgroundColor ?? AppTheme.white,
      elevation: 0,
      centerTitle: widget.centerTitle,
      title: Image.asset(
        'assets/images/ic_logo_app.png',
        height: 32,
      ),
      leading: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(12),
            child: SizedBox(
              width: 32,
              height: 32,
              child: MaterialButton(
                color: AppTheme.white,
                padding: const EdgeInsets.all(4),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                onPressed: () {
                  Navigator.maybePop(context);
                },
                child: ImageIcon(
                  AssetImage(imagePaths('ic_back')),
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
      // actions: widget.actions != null ? widget.actions : [],
    );
  }
}
