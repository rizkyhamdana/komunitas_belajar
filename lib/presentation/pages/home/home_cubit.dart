import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:komunitas_belajar/config/services/injection.dart';
import 'package:komunitas_belajar/config/util/utility.dart';
import 'package:komunitas_belajar/domain/repository/app_repository.dart';
import 'package:komunitas_belajar/presentation/pages/home/home_state.dart';

@lazySingleton
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  var appRepository = getIt<AppRepository>();

  void closeCubit() {
    close();
  }

  void getCommunityEvent() async {
    try {
      emit(HomeLoading());
      var result = await appRepository.getCommunityEvent();

      emit(HomeLoaded(listCommunityEvent: result.communityEvent ?? []));
    } catch (e) {
      emit(HomeError(error: Utility.handleErrorString(e.toString())));
    }
  }
}
