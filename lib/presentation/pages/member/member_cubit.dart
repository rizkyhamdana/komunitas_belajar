import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:komunitas_belajar/config/services/injection.dart';
import 'package:komunitas_belajar/config/util/utility.dart';
import 'package:komunitas_belajar/domain/repository/app_repository.dart';
import 'package:komunitas_belajar/presentation/pages/member/member_state.dart';

@lazySingleton
class MemberCubit extends Cubit<MemberState> {
  MemberCubit() : super(MemberInitial());

  var appRepository = getIt<AppRepository>();

  void closeCubit() {
    close();
  }

  void getListMember() async {
    try {
      emit(MemberLoading());
      var result = await appRepository.getListMember();

      emit(MemberLoaded(listMember: result.listMember ?? []));
    } catch (e) {
      emit(MemberError(error: Utility.handleErrorString(e.toString())));
    }
  }
}
