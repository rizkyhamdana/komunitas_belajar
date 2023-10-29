import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:komunitas_belajar/config/route/app_route.gr.dart';
import 'package:komunitas_belajar/config/util/app_theme.dart';
import 'package:komunitas_belajar/data/model/community_event.dart';
import 'package:komunitas_belajar/presentation/widget/custom_appbar.dart';
import 'package:path_provider/path_provider.dart';

@RoutePage()
class CameraCommunityEventPage extends StatefulWidget {
  const CameraCommunityEventPage({super.key});

  @override
  State<CameraCommunityEventPage> createState() =>
      _CameraCommunityEventPageState();
}

class _CameraCommunityEventPageState extends State<CameraCommunityEventPage> {
  CameraController? _cameraController;
  late List<CameraDescription> _cameras;
  int? selectedCameraIndex;
  ImageProvider<Object>? myEktp;
  XFile? imageFile;
  final picker = ImagePicker();

  Future initCameras(CameraDescription cameraDescription) async {
    if (_cameraController != null) {
      await _cameraController!.dispose();
    }
    _cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.high,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );
    _cameraController!.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });

    if (_cameraController!.value.hasError) {
      debugPrint('Camera Error');
    }
    try {
      await _cameraController!.initialize();
    } catch (e) {
      debugPrint('Camera Error: $e');
    }
    if (mounted) {
      setState(() {});
    }
  }

  gotoNextPage(CommunityEvent communityEvent) {
    context.router
        .navigate(CommunityEventUploadPage(communityEvent: communityEvent));
  }

  String formatDateNow() {
    final now = DateTime.now();
    final formatter = DateFormat('ddMMyyyyHHmm');
    return formatter.format(now);
  }

  void onTakePictureButtonPressed() async {
    var result = await takePicture();
    if (mounted) {
      setState(() {
        imageFile = result;
      });
    }

    if (result != null) {
      img.Image? capturedImage =
          img.decodeImage(await File(result.path).readAsBytes());
      img.Image orientedImage = img.copyRotate(capturedImage!, angle: -90);
      Uint8List imageInUnit8List = img.encodeJpg(orientedImage);
      File? file = uint8ListToFile(imageInUnit8List, "$formatDateNow(),png");
      if (file != null) {
        var imageCrop = await ImageCropper().cropImage(
          sourcePath: file.path,
          aspectRatio: const CropAspectRatio(ratioX: 16.0, ratioY: 9.0),
          aspectRatioPresets: [CropAspectRatioPreset.ratio16x9],
          uiSettings: [
            AndroidUiSettings(
                toolbarTitle: 'Cropper',
                toolbarColor: AppTheme.blue1,
                toolbarWidgetColor: Colors.white,
                initAspectRatio: CropAspectRatioPreset.ratio16x9,
                lockAspectRatio: true),
            IOSUiSettings(title: 'Cropper', aspectRatioLockEnabled: true),
          ],
        );
        if (imageCrop != null) {
          CommunityEvent communityEvent =
              CommunityEvent(imageUpload: File(imageCrop.path));
          gotoNextPage(communityEvent);
        }
      }
    }
  }

  File? uint8ListToFile(Uint8List uint8List, String filename) {
    try {
      final buffer = uint8List.buffer.asUint8List();
      final tempDir = Directory.systemTemp;
      final filePath = "${tempDir.path}/$filename";
      final file = File(filePath);
      file.writeAsBytesSync(buffer);
      return file;
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  Future<XFile?> takePicture() async {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      debugPrint('Error: select a camera first.');
      return null;
    }

    if (_cameraController!.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      final XFile file = await _cameraController!.takePicture();
      return file;
    } on CameraException catch (e) {
      debugPrint('cameraExcepetion: $e');
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    availableCameras().then((value) {
      _cameras = value;
      debugPrint('Camera Value');
      if (_cameras.isNotEmpty) {
        selectedCameraIndex = 0;
        initCameras(_cameras[selectedCameraIndex!]).then((value) {});
      } else {
        debugPrint('Camera not found');
      }
    }).catchError((e) {
      debugPrint(e.toString());
    });
  }

  @override
  void dispose() {
    _cameraController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.bgColor,
        appBar: const CustomAppBar(title: ''),
        body: bodyView());
  }

  Widget bloc() {
    return bodyView();
  }

  Widget bodyView() {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              color: AppTheme.white,
              padding: const EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Center(
                  child: Text(
                    'Ambil Gambar',
                    style: AppTheme.subtitle2(color: AppTheme.blue1),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom + 24),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(child: cameraPreview()),
                ),
              ),
            ),
          ],
        ),
        Positioned(left: 0, bottom: 0, right: 0, child: footerView())
      ],
    );
  }

  Widget footerView() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: AppTheme.white,
      padding: EdgeInsets.fromLTRB(
          48, 24, 48, MediaQuery.of(context).padding.bottom + 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            width: 32,
            height: 32,
          ),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
                color: AppTheme.blue1, borderRadius: BorderRadius.circular(50)),
            child: FloatingActionButton.large(
              backgroundColor: AppTheme.white,
              onPressed: onTakePictureButtonPressed,
              child: const Icon(
                Icons.camera,
                color: AppTheme.blue1,
              ),
            ),
          ),
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
                color: AppTheme.blue1,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppTheme.blue1)),
            child: MaterialButton(
              padding: EdgeInsets.zero,
              onPressed: _getPhotoByGallery,
              child: const Icon(
                Icons.panorama,
                color: AppTheme.white,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget cameraPreview() {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return const Text('Loading');
    } else {
      return ClipRect(
        child: OverflowBox(
          minWidth: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CameraPreview(
                _cameraController!,
              ),
            ),
          ),
        ),
      );
    }
  }

  Future<void> _getPhotoByGallery() async {
    try {
      final XFile? pickedFile =
          await picker.pickImage(source: ImageSource.gallery);
      setState(() {});

      debugPrint('Data: ${pickedFile?.path}');
      if (pickedFile != null) {
        await ImageCropper().cropImage(
          sourcePath: pickedFile.path,
          aspectRatio: const CropAspectRatio(ratioX: 16.0, ratioY: 9.0),
          aspectRatioPresets: [CropAspectRatioPreset.ratio16x9],
          uiSettings: [
            AndroidUiSettings(
                toolbarTitle: 'Cropper',
                toolbarColor: AppTheme.blue1,
                toolbarWidgetColor: Colors.white,
                initAspectRatio: CropAspectRatioPreset.ratio16x9,
                lockAspectRatio: true),
            IOSUiSettings(title: 'Cropper', aspectRatioLockEnabled: true),
          ],
        );
      } else {}
      // if (_data != null) {
      //   navigationTo(QrisInputNominalPage.routes, []);
      // } else {

      // }
    } catch (e) {
      debugPrint('Error: $e');
    }
  }
}
