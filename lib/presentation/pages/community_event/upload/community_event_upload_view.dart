import 'package:auto_route/auto_route.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:komunitas_belajar/config/route/app_route.gr.dart';
import 'package:komunitas_belajar/config/services/injection.dart';
import 'package:komunitas_belajar/config/util/app_theme.dart';
import 'package:komunitas_belajar/data/model/community_event.dart';
import 'package:komunitas_belajar/data/model/list_class.dart';
import 'package:komunitas_belajar/data/model/member.dart';
import 'package:komunitas_belajar/presentation/pages/community_event/upload/community_event_upload_cubit.dart';
import 'package:komunitas_belajar/presentation/pages/community_event/upload/community_event_upload_state.dart';
import 'package:komunitas_belajar/presentation/widget/custom_appbar.dart';
import 'package:komunitas_belajar/presentation/widget/custom_button.dart';
import 'package:komunitas_belajar/presentation/widget/custom_text_field.dart';
import 'package:komunitas_belajar/presentation/widget/spacing.dart';

@RoutePage()
class CommunityEventUploadPage extends StatefulWidget {
  const CommunityEventUploadPage({super.key, required this.communityEvent});
  final CommunityEvent communityEvent;

  @override
  State<CommunityEventUploadPage> createState() =>
      _CommunityEventUploadPageState();
}

class _CommunityEventUploadPageState extends State<CommunityEventUploadPage> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var classDescController = TextEditingController();
  var memberNameController = TextEditingController();
  Member memberChoosed = Member();

  bool formValidate() {
    return titleController.text != "" &&
        descriptionController.text != "" &&
        classDescController.text != "" &&
        memberNameController.text != "";
  }

  String formatDateNow() {
    final now = DateTime.now();
    final formatter = DateFormat('dd MMMM yyyy'); // 'id' for Indonesian locale
    return formatter.format(now);
  }

  var cubit = getIt<CommunityEventUploadCubit>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.bgColor,
        appBar: const CustomAppBar(title: ''),
        body:
            BlocConsumer<CommunityEventUploadCubit, CommunityEventUploadState>(
          bloc: cubit,
          listener: (context, state) async {
            if (state is CommunityEventUploadLoading) {
              EasyLoading.show();
            } else if (state is MemberLoaded) {
              EasyLoading.dismiss();
              Member result = await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                context: context,
                builder: ((context) {
                  return Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top + 100,
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    padding: const EdgeInsets.only(
                        top: 8, left: 16, right: 16, bottom: 24),
                    decoration: const BoxDecoration(
                      color: AppTheme.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16)),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          width: 40,
                          height: 6,
                          decoration: const BoxDecoration(
                              color: AppTheme.blackColor2,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4))),
                        ),
                        verticalSpacing(
                          28,
                        ),
                        Container(
                          padding: EdgeInsets.zero,
                          width: double.infinity,
                          child: Text(
                            'Pilih Member',
                            style: AppTheme.subtitle2(),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        verticalSpacing(
                          24,
                        ),
                        Flexible(
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              children: state.listMember.map((e) {
                                return _buildListMember(e);
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              );
              setState(() {
                memberChoosed = result;
              });
              memberNameController.text = result.name ?? "";
              // context.router.replace(const BasePage());
            } else if (state is ListClassLoaded) {
              EasyLoading.dismiss();
              ListClass result = await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                context: context,
                builder: ((context) {
                  return Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top + 100,
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    padding: const EdgeInsets.only(
                        top: 8, left: 16, right: 16, bottom: 24),
                    decoration: const BoxDecoration(
                      color: AppTheme.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16)),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          width: 40,
                          height: 6,
                          decoration: const BoxDecoration(
                              color: AppTheme.blackColor2,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4))),
                        ),
                        verticalSpacing(
                          28,
                        ),
                        Container(
                          padding: EdgeInsets.zero,
                          width: double.infinity,
                          child: Text(
                            'Pilih Kelas',
                            style: AppTheme.subtitle2(),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        verticalSpacing(
                          24,
                        ),
                        Flexible(
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              children: state.listClass.map((e) {
                                return _buildListClass(e);
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              );

              classDescController.text = result.classDesc ?? "";
              // context.router.replace(const BasePage());
            } else if (state is CommunityEventUploadLoaded) {
              EasyLoading.dismiss();
              AutoRouter.of(context).push(const BasePage());
            } else if (state is CommunityEventUploadError) {
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
            return bodyView();
          },
        ));
  }

  bodyView() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Upload Foto',
                    style: AppTheme.subtitle2(color: AppTheme.blue1),
                  ),
                  verticalSpacing(),
                  Image.file(widget.communityEvent.imageUpload!),
                  verticalSpacing(),
                  CustomTextField(
                    labelText: 'Judul Kegiatan',
                    textFieldController: titleController,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Field username tidak boleh kosong';
                      }
                      return null;
                    },
                    onChanged: (p0) {
                      setState(() {});
                    },
                  ),
                  verticalSpacing(),
                  CustomTextField(
                    labelText: 'Deskripsi',
                    textFieldController: descriptionController,
                    minLines: 5,
                    maxLines: 10,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Field username tidak boleh kosong';
                      }
                      return null;
                    },
                    onChanged: (p0) {
                      setState(() {});
                    },
                  ),
                  verticalSpacing(),
                  CustomTextField(
                    labelText: 'Kelas',
                    hintText: 'Kelas',
                    floatingLabelBehavior: classDescController.text != ""
                        ? FloatingLabelBehavior.auto
                        : FloatingLabelBehavior.never,
                    textFieldController: classDescController,
                    readOnly: true,
                    onTap: () {
                      cubit.getListClass();
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Field username tidak boleh kosong';
                      }
                      return null;
                    },
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: AppTheme.blackColor2,
                              size: 20,
                            ),
                            onPressed: () {
                              cubit.getListClass();
                            }),
                      ),
                    ),
                    onChanged: (p0) {
                      setState(() {});
                    },
                  ),
                  verticalSpacing(),
                  CustomTextField(
                    labelText: 'Nama Dokumenter',
                    hintText: 'Nama Dokumenter',
                    textFieldController: memberNameController,
                    floatingLabelBehavior: memberNameController.text != ""
                        ? FloatingLabelBehavior.auto
                        : FloatingLabelBehavior.never,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Field username tidak boleh kosong';
                      }
                      return null;
                    },
                    readOnly: true,
                    onTap: () {
                      cubit.getListMember();
                    },
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: AppTheme.blackColor2,
                              size: 20,
                            ),
                            onPressed: () {
                              cubit.getListMember();
                            }),
                      ),
                    ),
                    onChanged: (p0) {
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: formValidate()
                  ? CustomButton(
                      textButton: 'Upload',
                      buttonTap: () {
                        widget.communityEvent.title = titleController.text;
                        widget.communityEvent.desc = descriptionController.text;
                        widget.communityEvent.classDesc =
                            classDescController.text;
                        widget.communityEvent.uploadDate = formatDateNow();
                        widget.communityEvent.uploadBy = memberChoosed.name;
                        cubit.uploadCommunityEvent(
                            widget.communityEvent, memberChoosed.id ?? "");
                      })
                  : const CustomButtonDisabled(
                      textButton: 'Upload',
                    ))
        ],
      ),
    );
  }

  Widget _buildListMember(Member member) {
    return Container(
      alignment: Alignment.topLeft,
      child: MaterialButton(
        padding: const EdgeInsets.all(0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        onPressed: () {
          setState(() {});
          Navigator.pop(context, member);
        },
        child: Container(
          padding: const EdgeInsets.all(4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                member.name ?? "",
                style: AppTheme.body2(),
              ),
              verticalSpacing(),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: AppTheme.grayColor,
              ),
              verticalSpacing(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListClass(ListClass listClass) {
    return Container(
      alignment: Alignment.topLeft,
      child: MaterialButton(
        padding: const EdgeInsets.all(0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        onPressed: () {
          setState(() {});
          Navigator.pop(context, listClass);
        },
        child: Container(
          padding: const EdgeInsets.all(4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                listClass.classDesc ?? "",
                style: AppTheme.body2(),
              ),
              verticalSpacing(),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: AppTheme.grayColor,
              ),
              verticalSpacing(),
            ],
          ),
        ),
      ),
    );
  }
}
