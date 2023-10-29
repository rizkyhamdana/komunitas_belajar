import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:komunitas_belajar/config/services/injection.dart';
import 'package:komunitas_belajar/config/util/utility.dart';
import 'package:komunitas_belajar/data/model/about_us.dart';
import 'package:komunitas_belajar/domain/repository/app_repository.dart';
import 'package:komunitas_belajar/presentation/pages/about_us/about_us_state.dart';

@lazySingleton
class AboutUsCubit extends Cubit<AboutUsState> {
  AboutUsCubit() : super(AboutUsInitial());

  var appRepository = getIt<AppRepository>();

  void closeCubit() {
    close();
  }

  void getAboutUs() async {
    try {
      emit(AboutUsLoading());
      AboutUs result = await appRepository.getAboutUs();

      emit(AboutUsLoaded(aboutUs: result));
    } catch (e) {
      emit(AboutUsError(error: Utility.handleErrorString(e.toString())));
    }
  }
}
