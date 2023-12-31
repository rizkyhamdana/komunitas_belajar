import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:komunitas_belajar/config/util/app_theme.dart';
import 'package:komunitas_belajar/config/util/custom_widget.dart';
import 'package:komunitas_belajar/data/model/community_event.dart';
import 'package:komunitas_belajar/presentation/widget/custom_appbar.dart';
import 'package:komunitas_belajar/presentation/widget/spacing.dart';
import 'package:shimmer/shimmer.dart';

@RoutePage()
class EventDetailPage extends StatefulWidget {
  const EventDetailPage({super.key, required this.communityEvent});
  final CommunityEvent communityEvent;

  @override
  State<EventDetailPage> createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  var textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.bgColor,
        appBar: const CustomAppBar(title: ''),
        body: bodyView());
  }

  bodyView() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Detail Kegiatan',
              style: AppTheme.subtitle2(color: AppTheme.blue1),
            ),
          ),
          verticalSpacing(8),
          CachedNetworkImage(
            width: double.infinity,
            imageUrl: widget.communityEvent.image ?? "",
            fit: BoxFit.cover,
            errorWidget: (context, url, error) {
              return Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(imagePaths('image_placeholder')),
                  fit: BoxFit.cover,
                )),
              );
            },
            placeholder: (context, url) {
              return Shimmer.fromColors(
                baseColor: Colors.black12,
                highlightColor: AppTheme.white,
                child: Container(
                  width: double.infinity,
                  height: 180,
                  color: AppTheme.blue1,
                ),
              );
            },
          ),
          verticalSpacing(32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.communityEvent.title ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.subtitle3(),
                ),
                verticalSpacing(4),
                Text(
                  widget.communityEvent.classDesc ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.subtitle3(color: AppTheme.orange),
                ),
                verticalSpacing(4),
                Text(
                  "Diupload ${widget.communityEvent.uploadDate}, Oleh ${widget.communityEvent.uploadBy} ",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.body3(color: AppTheme.blackColor2),
                ),
                verticalSpacing(),
                Container(
                  width: double.infinity,
                  height: 0.5,
                  color: AppTheme.blackColor2,
                ),
                verticalSpacing(),
                Text(
                  widget.communityEvent.desc ?? "",
                  style: AppTheme.body2(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
