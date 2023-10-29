import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:komunitas_belajar/config/route/app_route.gr.dart';
import 'package:komunitas_belajar/config/util/app_theme.dart';
import 'package:komunitas_belajar/data/model/community_event.dart';
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

  bool formValidate() {
    return titleController.text != "" &&
        descriptionController.text != "" &&
        classDescController.text != "" &&
        memberNameController.text != "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.bgColor,
        appBar: const CustomAppBar(title: ''),
        body: bodyView());
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
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Field username tidak boleh kosong';
                      }
                      return null;
                    },
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: SizedBox(
                        width: 16,
                        height: 16,
                        child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: AppTheme.blackColor2,
                              size: 20,
                            ),
                            onPressed: () {}),
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
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: SizedBox(
                        width: 16,
                        height: 16,
                        child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: AppTheme.blackColor2,
                              size: 20,
                            ),
                            onPressed: () {}),
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
                        context.router.replaceAll([const BasePage()]);
                      })
                  : const CustomButtonDisabled(
                      textButton: 'Upload',
                    ))
        ],
      ),
    );
  }
}
