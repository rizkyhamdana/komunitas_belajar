import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:komunitas_belajar/config/services/injection.dart';
import 'package:komunitas_belajar/config/util/utility.dart';
import 'package:komunitas_belajar/data/model/community_event.dart';
import 'package:komunitas_belajar/domain/repository/app_repository.dart';
import 'package:komunitas_belajar/presentation/pages/community_event/upload/community_event_upload_state.dart';

@lazySingleton
class CommunityEventUploadCubit extends Cubit<CommunityEventUploadState> {
  CommunityEventUploadCubit() : super(CommunityEventUploadInitial());

  var appRepository = getIt<AppRepository>();

  void closeCubit() {
    close();
  }

  void getListMember() async {
    try {
      emit(CommunityEventUploadLoading());
      var result = await appRepository.getListMember();

      emit(MemberLoaded(listMember: result.listMember ?? []));
    } catch (e) {
      emit(CommunityEventUploadError(
          error: Utility.handleErrorString(e.toString())));
    }
  }

  void getListClass() async {
    try {
      emit(CommunityEventUploadLoading());
      var result = await appRepository.getListClass();

      emit(ListClassLoaded(listClass: result.listClass ?? []));
    } catch (e) {
      emit(CommunityEventUploadError(
          error: Utility.handleErrorString(e.toString())));
    }
  }

  void uploadCommunityEvent(
      CommunityEvent communityEvent, String idMember) async {
    try {
      emit(CommunityEventUploadLoading());
      await appRepository.uploadCommunityEvent(communityEvent, idMember);

      emit(CommunityEventUploadLoaded());
    } catch (e) {
      emit(CommunityEventUploadError(
          error: Utility.handleErrorString(e.toString())));
    }
  }
}
