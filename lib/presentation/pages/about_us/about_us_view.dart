import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:komunitas_belajar/config/util/app_theme.dart';

@RoutePage()
class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Tentang Kami',
                    style: AppTheme.subtitle2(color: AppTheme.blue1),
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
          // Add your onPressed code here!
        },
        child: const Icon(
          Icons.camera,
          color: AppTheme.white,
        ),
      ),
    );
  }
}
