import 'package:auto_route/auto_route.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:komunitas_belajar/config/route/app_route.gr.dart' as route;
import 'package:komunitas_belajar/config/util/app_theme.dart';
import 'package:komunitas_belajar/config/util/custom_widget.dart';
import 'package:komunitas_belajar/presentation/pages/about_us/about_us_view.dart';
import 'package:komunitas_belajar/presentation/pages/home/home_view.dart';
import 'package:komunitas_belajar/presentation/pages/home/sidebar/sidebar_view.dart';
import 'package:komunitas_belajar/presentation/pages/member/member_view.dart';
import 'package:sidebarx/sidebarx.dart';

@RoutePage()
class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int index = 0;
  late SidebarXController _controller;
  final _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _controller = SidebarXController(selectedIndex: 0, extended: true);

    _controller.addListener(() {
      setState(() {
        if (_controller.selectedIndex == 3) {
          _controller.selectIndex(index);
          AwesomeDialog(
            context: context,
            dialogType: DialogType.noHeader,
            animType: AnimType.scale,
            dialogBackgroundColor: AppTheme.bgColor,
            titleTextStyle: AppTheme.subtitle2(color: AppTheme.blackColor),
            descTextStyle: AppTheme.body3(color: AppTheme.blackColor),
            btnOkColor: AppTheme.blue1,
            buttonsTextStyle: AppTheme.subtitle3(color: AppTheme.white),
            title: 'Tutup Aplikasi?',
            desc: 'Apakah kamu yakin menutup aplikasi?',
            btnCancelText: 'Batal',
            btnCancelOnPress: () {},
            btnOkText: 'Ya',
            btnOkOnPress: () {
              context.router.replaceAll([const route.LoginPage()]);
            },
          ).show();
        } else {
          setState(() {
            index = _controller.selectedIndex;
          });
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.noHeader,
          animType: AnimType.scale,
          dialogBackgroundColor: AppTheme.bgColor,
          titleTextStyle: AppTheme.subtitle2(color: AppTheme.blackColor),
          descTextStyle: AppTheme.body3(color: AppTheme.blackColor),
          btnOkColor: AppTheme.blue1,
          buttonsTextStyle: AppTheme.subtitle3(color: AppTheme.white),
          title: 'Tutup Aplikasi?',
          desc: 'Apakah kamu yakin menutup aplikasi?',
          btnCancelText: 'Batal',
          btnCancelOnPress: () {},
          btnOkText: 'Ya',
          btnOkOnPress: () {
            context.router.replaceAll([const route.LoginPage()]);
          },
        ).show();
        return false;
      },
      child: Builder(
        builder: (context) {
          final isSmallScreen = MediaQuery.of(context).size.width < 600;
          return Scaffold(
            key: _key,
            backgroundColor: AppTheme.bgColor,
            appBar: isSmallScreen
                ? AppBar(
                    elevation: 0,
                    backgroundColor: AppTheme.white,
                    title: Padding(
                      padding: const EdgeInsets.only(right: 56),
                      child: Center(
                        child: Image.asset(
                          'assets/images/ic_logo_app.png',
                          height: 32,
                        ),
                      ),
                    ),
                    leading: Container(
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
                            _key.currentState?.openDrawer();
                          },
                          child: ImageIcon(
                            AssetImage(imagePaths('ic_menu')),
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  )
                : null,
            drawer: Sidebar(
              controller: _controller,
            ),
            body: Row(
              children: [
                if (!isSmallScreen)
                  Sidebar(
                    controller: _controller,
                  ),
                Expanded(
                  child: Center(
                    child: ScreenView(
                      controller: _controller,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ScreenView extends StatelessWidget {
  const ScreenView({
    super.key,
    required this.controller,
  });

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        switch (controller.selectedIndex) {
          case 0:
            return const HomePage();

          case 1:
            return const MemberPage();
          case 2:
            return const AboutUsPage();
          default:
            return const HomePage();
        }
      },
    );
  }
}
