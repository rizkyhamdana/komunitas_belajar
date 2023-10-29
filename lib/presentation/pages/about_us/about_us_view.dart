import 'package:auto_route/auto_route.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:komunitas_belajar/config/services/injection.dart';
import 'package:komunitas_belajar/config/util/app_theme.dart';
import 'package:komunitas_belajar/data/model/about_us.dart';
import 'package:komunitas_belajar/presentation/pages/about_us/about_us_cubit.dart';
import 'package:komunitas_belajar/presentation/pages/about_us/about_us_state.dart';
import 'package:komunitas_belajar/presentation/widget/spacing.dart';

@RoutePage()
class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  var textFieldController = TextEditingController();
  AboutUs aboutUs = AboutUs();
  var cubit = getIt<AboutUsCubit>();

  @override
  void initState() {
    super.initState();
    cubit.getAboutUs();
  }

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
              child: BlocConsumer<AboutUsCubit, AboutUsState>(
                bloc: cubit,
                listener: (context, state) {
                  if (state is AboutUsLoading) {
                  } else if (state is AboutUsLoaded) {
                    setState(() {
                      aboutUs = state.aboutUs;
                    });
                  }
                  if (state is AboutUsError) {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.error,
                      animType: AnimType.rightSlide,
                      title: 'Error',
                      desc: state.error,
                    ).show();
                  }
                },
                builder: (context, state) {
                  return SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pembina Pengawas Manajerial:',
                          style: AppTheme.body2(),
                        ),
                        verticalSpacing(8),
                        Text(
                          aboutUs.elder ?? "",
                          style: AppTheme.subtitle3(),
                        ),
                        verticalSpacing(),
                        Text(
                          'Penanggung Jawab:',
                          style: AppTheme.body2(),
                        ),
                        verticalSpacing(8),
                        Text(
                          aboutUs.pic ?? "",
                          style: AppTheme.subtitle3(),
                        ),
                        verticalSpacing(),
                        Text(
                          'Ketua:',
                          style: AppTheme.body2(),
                        ),
                        verticalSpacing(8),
                        Text(
                          aboutUs.leader ?? "",
                          style: AppTheme.subtitle3(),
                        ),
                        verticalSpacing(),
                        Text(
                          'Sekretaris:',
                          style: AppTheme.body2(),
                        ),
                        verticalSpacing(8),
                        Text(
                          aboutUs.secretary ?? "",
                          style: AppTheme.subtitle3(),
                        ),
                        verticalSpacing(),
                        Text(
                          'Bendahara',
                          style: AppTheme.body2(),
                        ),
                        verticalSpacing(8),
                        Text(
                          aboutUs.treasurer ?? "",
                          style: AppTheme.subtitle3(),
                        ),
                        verticalSpacing(),
                        Text(
                          'Alamat Komunitas:',
                          style: AppTheme.body2(),
                        ),
                        verticalSpacing(8),
                        Text(
                          aboutUs.address ?? "",
                          style: AppTheme.subtitle3(),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
