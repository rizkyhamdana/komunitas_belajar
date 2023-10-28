import 'package:auto_route/auto_route.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:komunitas_belajar/config/route/app_route.gr.dart';
import 'package:komunitas_belajar/config/services/injection.dart';
import 'package:komunitas_belajar/config/util/app_theme.dart';
import 'package:komunitas_belajar/config/util/custom_widget.dart';
import 'package:komunitas_belajar/data/model/community_event.dart';
import 'package:komunitas_belajar/presentation/pages/home/home_cubit.dart';
import 'package:komunitas_belajar/presentation/pages/home/home_state.dart';
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
  var cubit = getIt<HomeCubit>();

  List<CommunityEvent> listCommunityEvent = [];
  @override
  void initState() {
    super.initState();
    cubit.getCommunityEvent();
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
            Expanded(
              child: BlocConsumer<HomeCubit, HomeState>(
                bloc: cubit,
                listener: (context, state) {
                  if (state is HomeLoading) {
                    EasyLoading.show();
                  } else if (state is HomeLoaded) {
                    EasyLoading.dismiss();
                    setState(() {
                      listCommunityEvent = state.listCommunityEvent;
                    });
                    // context.router.replace(const BasePage());
                  }
                  if (state is HomeError) {
                    EasyLoading.dismiss();
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
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: listCommunityEvent.length,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return _buildListEvent(listCommunityEvent[index]);
                          },
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

  _buildListEvent(CommunityEvent communityEvent) {
    return Container(
      decoration: BoxDecoration(
          color: AppTheme.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: AppTheme.boxShadow2),
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16)),
              image: DecorationImage(
                image: NetworkImage(
                  communityEvent.image ?? "",
                ),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  communityEvent.title ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.subtitle3(),
                ),
                verticalSpacing(4),
                Text(
                  "Diupload oleh: ${communityEvent.uploadBy}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.subtitle3(color: AppTheme.orange),
                ),
                verticalSpacing(4),
                Text(
                  communityEvent.uploadDate ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.body2(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
