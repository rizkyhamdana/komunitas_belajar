import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:komunitas_belajar/config/services/injection.dart';
import 'package:komunitas_belajar/config/util/utility.dart';
import 'package:komunitas_belajar/domain/repository/app_repository.dart';
import 'package:komunitas_belajar/presentation/pages/login/login_state.dart';

@lazySingleton
class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  var appRepository = getIt<AppRepository>();

  void closeCubit() {
    close();
  }

  void login(String username, String password) async {
    try {
      emit(LoginLoading());
      var result = await appRepository.login();

      if (result.username == username && result.password == password) {
        emit(LoginLoaded());
      } else {
        emit(const LoginError(error: 'Akun tidak terdaftar'));
      }
    } catch (e) {
      emit(LoginError(error: Utility.handleErrorString(e.toString())));
    }
  }
}
