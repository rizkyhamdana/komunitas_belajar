import 'package:flutter/material.dart';
import 'package:komunitas_belajar/config/util/app_theme.dart';
import 'package:komunitas_belajar/config/util/custom_widget.dart';
import 'package:komunitas_belajar/presentation/widget/spacing.dart';
import 'package:sidebarx/sidebarx.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({
    super.key,
    required SidebarXController controller,
  }) : _controller = controller;

  final SidebarXController _controller;

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    if (widget._controller.extended) {
      _animationController?.forward();
    } else {
      _animationController?.reverse();
    }
    widget._controller.extendStream.listen(
      (extended) {
        if (_animationController?.isCompleted ?? false) {
          _animationController?.reverse();
        } else {
          _animationController?.forward();
        }
      },
    );

    currentIndex = widget._controller.selectedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: widget._controller,
      theme: SidebarXTheme(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        decoration: BoxDecoration(
          color: AppTheme.white,
          borderRadius: BorderRadius.circular(20),
        ),
        itemMargin: const EdgeInsets.only(left: 8, right: 8, bottom: 4),
        itemPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        selectedItemPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        selectedItemMargin: const EdgeInsets.only(left: 8, right: 8, bottom: 4),
        hoverColor: scaffoldBackgroundColor,
        textStyle: AppTheme.sidebarTextStyle(),
        selectedTextStyle: AppTheme.sidebarTextStyle(color: AppTheme.white),
        itemTextPadding: const EdgeInsets.only(
          left: 12,
        ),
        selectedItemTextPadding: const EdgeInsets.only(left: 12),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        selectedItemDecoration: BoxDecoration(
          color: AppTheme.blue1,
          borderRadius: BorderRadius.circular(16),
        ),
        iconTheme: const IconThemeData(
          color: AppTheme.blackColor,
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      extendedTheme: SidebarXTheme(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        width: 200,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20))),
      ),
      headerBuilder: (context, extended) {
        if (extended) {
          return Padding(
            padding: EdgeInsets.fromLTRB(
                0, MediaQuery.of(context).padding.top, 64, 0),
            child: Image.asset(
              'assets/images/ic_logo_app2.png',
              height: 80,
            ),
          );
        } else {
          return Padding(
            padding: EdgeInsets.fromLTRB(
                12, MediaQuery.of(context).padding.top, 12, 0),
            child: Image.asset(
              'assets/images/ic_logo_app.png',
              height: 80,
            ),
          );
        }
      },
      footerItems: [
        SidebarXItem(
          iconWidget: ImageIcon(
            AssetImage(imagePaths('ic_help')),
            size: 24,
            color: currentIndex == 4 ? Colors.white : Colors.black,
          ),
          label: 'Bantuan',
          onTap: () {
            setState(() {
              currentIndex = 4;
            });
          },
        ),
        SidebarXItem(
          iconWidget: Row(
            children: [
              ImageIcon(
                AssetImage(imagePaths('ic_logout')),
                size: 24,
                color: Colors.red,
              ),
              Row(
                children: [
                  horizontalSpacing(12),
                  Text(
                    'Logout',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppTheme.sidebarTextStyle(color: Colors.red),
                  )
                ],
              ),
            ],
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
      items: [
        SidebarXItem(
          iconWidget: ImageIcon(
            AssetImage(imagePaths('ic_home')),
            size: 24,
            color: currentIndex == 0 ? Colors.white : Colors.black,
          ),
          label: 'Home',
          onTap: () {
            setState(() {
              currentIndex = 0;
            });
          },
        ),
        SidebarXItem(
          iconWidget: ImageIcon(
            AssetImage(imagePaths('ic_food')),
            size: 24,
            color: currentIndex == 1 ? Colors.white : Colors.black,
          ),
          label: 'Atur Produk',
          onTap: () {
            setState(() {
              currentIndex = 1;
            });
          },
        ),
        SidebarXItem(
          iconWidget: ImageIcon(
            AssetImage(imagePaths('ic_report')),
            size: 24,
            color: currentIndex == 2 ? Colors.white : Colors.black,
          ),
          label: 'Laporan',
          onTap: () {
            setState(() {
              currentIndex = 2;
            });
          },
        ),
        SidebarXItem(
          iconWidget: ImageIcon(
            AssetImage(imagePaths('ic_setting')),
            size: 24,
            color: currentIndex == 3 ? Colors.white : Colors.black,
          ),
          label: 'Pengaturan',
          onTap: () {
            setState(() {
              currentIndex = 3;
            });
          },
        ),
      ],
      toggleButtonBuilder: (context, extended) => Container(),
    );
  }
}

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
const divider = Divider(color: AppTheme.blackColor2, height: 1);
