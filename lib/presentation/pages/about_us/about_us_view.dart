import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:komunitas_belajar/config/util/app_theme.dart';
import 'package:komunitas_belajar/presentation/widget/spacing.dart';

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
            Expanded(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Penanggung Jawab:',
                      style: AppTheme.body2(),
                    ),
                    verticalSpacing(8),
                    Text(
                      'BASO SIRAJUDDIN, S.Pd., M.Si',
                      style: AppTheme.subtitle3(),
                    ),
                    verticalSpacing(),
                    Text(
                      'Ketua:',
                      style: AppTheme.body2(),
                    ),
                    verticalSpacing(8),
                    Text(
                      'AGUNG SETIAWAN, S.Pd',
                      style: AppTheme.subtitle3(),
                    ),
                    verticalSpacing(),
                    Text(
                      'Sekretaris:',
                      style: AppTheme.body2(),
                    ),
                    verticalSpacing(8),
                    Text(
                      'ANDI IKA YUDIARTIKA, S.Pd.',
                      style: AppTheme.subtitle3(),
                    ),
                    verticalSpacing(),
                    Text(
                      'Bendahara',
                      style: AppTheme.body2(),
                    ),
                    verticalSpacing(8),
                    Text(
                      'RAHMIANTI, S.Pd',
                      style: AppTheme.subtitle3(),
                    ),
                    verticalSpacing(),
                    Text(
                      'Alamat Komunitas:',
                      style: AppTheme.body2(),
                    ),
                    verticalSpacing(8),
                    Text(
                      'UPTD SMPN 1 Majauleng, Jln. Nuri, Desa Rumpia, Kecamatan Majauleng, Kabupaten Wajo, Sulawesi Selatan 90991',
                      style: AppTheme.subtitle3(),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
