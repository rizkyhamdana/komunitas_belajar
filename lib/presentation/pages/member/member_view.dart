import 'package:auto_route/auto_route.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:komunitas_belajar/config/services/injection.dart';
import 'package:komunitas_belajar/config/util/app_theme.dart';
import 'package:komunitas_belajar/config/util/custom_widget.dart';
import 'package:komunitas_belajar/data/model/member.dart';
import 'package:komunitas_belajar/presentation/pages/member/member_cubit.dart';
import 'package:komunitas_belajar/presentation/pages/member/member_state.dart';
import 'package:komunitas_belajar/presentation/widget/custom_text_field.dart';
import 'package:komunitas_belajar/presentation/widget/spacing.dart';
import 'package:shimmer/shimmer.dart';

@RoutePage()
class MemberPage extends StatefulWidget {
  const MemberPage({super.key});

  @override
  State<MemberPage> createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  var textFieldController = TextEditingController();
  List<Member> listMember = [];
  var cubit = getIt<MemberCubit>();

  @override
  void initState() {
    super.initState();
    cubit.getListMember();
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
                      'Anggota Komunitas',
                      style: AppTheme.subtitle2(color: AppTheme.blue1),
                    ),
                  ),
                  verticalSpacing(),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          hintText: 'Cari anggota disini...',
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
              child: BlocConsumer<MemberCubit, MemberState>(
                bloc: cubit,
                listener: (context, state) {
                  if (state is MemberLoading) {
                  } else if (state is MemberLoaded) {
                    setState(() {
                      listMember = state.listMember;
                    });
                    // context.router.replace(const BasePage());
                  }
                  if (state is MemberError) {
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
                  if (state is MemberLoaded) {
                    return SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: listMember.length,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return _buildListMember(listMember[0]);
                            },
                          ),
                        ],
                      ),
                    );
                  } else {
                    return SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 10,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return _buildListLoading();
                            },
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildListMember(Member member) {
    return Column(
      children: [
        verticalSpacing(),
        MaterialButton(
          onPressed: () {},
          padding: EdgeInsets.zero,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: AppTheme.white),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8)),
                  child: CachedNetworkImage(
                    width: 72,
                    imageUrl: member.photo ?? "",
                    errorWidget: (context, url, error) {
                      return Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    imagePaths('image_placeholder')))),
                      );
                    },
                    placeholder: (context, url) {
                      return Shimmer.fromColors(
                        baseColor: Colors.black12,
                        highlightColor: AppTheme.white,
                        child: Container(
                          width: 72,
                          height: 72,
                          color: AppTheme.blue1,
                        ),
                      );
                    },
                  ),
                ),
                horizontalSpacing(8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        member.name ?? "",
                        style: AppTheme.subtitle3(),
                      ),
                      verticalSpacing(8),
                      Text(
                        member.position ?? "",
                        style: AppTheme.body2(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildListLoading() {
    return Shimmer.fromColors(
      baseColor: AppTheme.blackShadow,
      highlightColor: AppTheme.blackColor2,
      child: Container(
        height: 72,
        decoration: BoxDecoration(
            color: AppTheme.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: AppTheme.boxShadow2),
        margin: const EdgeInsets.only(top: 16),
      ),
    );
  }
}
