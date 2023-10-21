import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:komunitas_belajar/config/route/app_route.gr.dart';
import 'package:komunitas_belajar/config/util/app_theme.dart';
import 'package:komunitas_belajar/config/util/custom_widget.dart';
import 'package:komunitas_belajar/presentation/widget/custom_text_field.dart';
import 'package:komunitas_belajar/presentation/widget/spacing.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppTheme.bgColor,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: AppTheme.white,
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Dokumentasi Kegiatan',
                      style: AppTheme.subtitle2(color: AppTheme.blue1),
                    ),
                  ),
                  verticalSpacing(),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          hintText: 'Cari kegiatan disini...',
                          textFieldController: textFieldController,
                        ),
                      ),
                      horizontalSpacing(8),
                      SizedBox(
                        width: 48,
                        height: 48,
                        child: MaterialButton(
                          color: AppTheme.white,
                          elevation: 0,
                          padding: const EdgeInsets.all(4),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4.0),
                            ),
                            side: BorderSide(
                                color: AppTheme.blackShadow, width: 1),
                          ),
                          onPressed: () {},
                          child: ImageIcon(
                            AssetImage(imagePaths('ic_search')),
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppTheme.blue1,
        onPressed: () {
          context.router.push(const CameraCommunityEventPage());
        },
        child: const Icon(
          Icons.camera,
          color: AppTheme.white,
        ),
      ),
    );
  }
}
