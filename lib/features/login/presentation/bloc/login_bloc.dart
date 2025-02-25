import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vnpt_his/core/services/biometric_auth_service.dart';
import 'package:vnpt_his/core/services/credential_storage_service.dart';
import 'package:vnpt_his/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:vnpt_his/routes/app_routes.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:vnpt_his/utils/shared_pref_utils.dart';

/// State
class LoginState {
  final String username;
  final String password;
  final bool rememberMe;
  final String? usernameError;
  final String? passwordError;
  final String? loginError;
  final String languageId;

  const LoginState({
    this.username = '',
    this.password = '',
    this.rememberMe = false,
    this.usernameError,
    this.passwordError,
    this.loginError,
    this.languageId = 'vi',
  });

  LoginState copyWith({
    String? username,
    String? password,
    bool? rememberMe,
    String? usernameError,
    String? passwordError,
    String? loginError,
    String? languageId,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      rememberMe: rememberMe ?? this.rememberMe,
      usernameError: usernameError,
      passwordError: passwordError,
      loginError: loginError,
      languageId: languageId ?? this.languageId,
    );
  }
}

/// Event
abstract class LoginEvent {}

class UsernameChanged extends LoginEvent {
  final String username;
  UsernameChanged(this.username);
}

class PasswordChanged extends LoginEvent {
  final String password;
  PasswordChanged(this.password);
}

class RememberMeChanged extends LoginEvent {
  final bool rememberMe;
  RememberMeChanged(this.rememberMe);
}

class LoginSubmitted extends LoginEvent {
  final BuildContext context;
  LoginSubmitted(this.context);
}

class ChooseLanguage extends LoginEvent {
  final String languageId;

  ChooseLanguage(this.languageId);
}

class GetInitialData extends LoginEvent {}

/// Sự kiện login bằng sinh trắc học
class BiometricLoginEvent extends LoginEvent {
  final BuildContext context;
  BiometricLoginEvent(this.context);
}

/// BLoC
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final CredentialStorage credentialStorage;
  final BiometricAuthHelper biometricAuthHelper;

  LoginBloc({
    required this.credentialStorage,
    required this.biometricAuthHelper,
  }) : super(const LoginState()) {
    on<UsernameChanged>((event, emit) {
      emit(state.copyWith(username: event.username, usernameError: null));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password, passwordError: null));
    });

    on<RememberMeChanged>((event, emit) {
      emit(state.copyWith(rememberMe: event.rememberMe));
    });

    on<LoginSubmitted>(_onLoginSubmitted);
    on<BiometricLoginEvent>(_onBiometricLogin);
  }

  /// Xử lý khi nhấn "Đăng nhập" (username, password)
  Future<void> _onLoginSubmitted(
      LoginSubmitted event, Emitter<LoginState> emit) async {
    if (state.username.isEmpty) {
      emit(state.copyWith(usernameError: "Tên đăng nhập không được để trống"));
    } else if (state.password.isEmpty) {
      emit(state.copyWith(passwordError: "Mật khẩu không được để trống"));
    } else {
      // TODO: Gửi request login đến server => Giả sử login success
      bool loginSuccess =
          (state.username == "admin" && state.password == "123456");
      if (loginSuccess) {
        // Nếu rememberMe = true => lưu credentials
        if (state.rememberMe) {
          await credentialStorage.saveCredentials(state.username, state.password);
        } else {
          // Xoá credentials nếu user không muốn nhớ
          await credentialStorage.clearCredentials();
        }

        // Điều hướng vào màn hình chính
        event.context.push(AppRoutes.navigation);
      } else {
        print("Tên đăng nhập hoặc mật khẩu sai");
        emit(state.copyWith(loginError: "Tên đăng nhập hoặc mật khẩu sai"));
      }
    }
  }

  /// Xử lý khi nhấn nút "Đăng nhập bằng sinh trắc học" (FaceID / TouchID)
  Future<void> _onBiometricLogin(
      BiometricLoginEvent event, Emitter<LoginState> emit) async {
    // 1. Kiểm tra xem đã lưu credentials chưa
    final creds = await credentialStorage.getCredentials();
    if (creds == null) {
      // Chưa có credentials => Không thể login bằng sinh trắc
      print("Chưa lưu thông tin đăng nhập");
      emit(state.copyWith(loginError: "Chưa lưu thông tin đăng nhập"));
      return;
    }

    // 2. Kiểm tra thiết bị có hỗ trợ biometrics không
    final canCheck = await biometricAuthHelper.canCheckBiometrics();
    if (!canCheck) {
      print("Thiết bị không hỗ trợ sinh trắc học");
      emit(state.copyWith(loginError: "Thiết bị không hỗ trợ sinh trắc học"));
      return;
    }

    // 3. Thực hiện xác thực
    final didAuthenticate = await biometricAuthHelper.authenticate();
    if (!didAuthenticate) {
      print("Xác thực sinh trắc học thất bại");
      emit(state.copyWith(loginError: "Xác thực sinh trắc học thất bại"));
      return;
    }

    // 4. Nếu xác thực thành công => Lấy username, password => gửi request login
    final username = creds['username']!;
    final password = creds['password']!;
    // Giả sử login API => success
    bool loginSuccess = (username == "admin" && password == "123456");
    if (loginSuccess) {
      // Vì user đã nhớ mật khẩu => ko cần lưu nữa
      // Hoặc nếu logic yêu cầu, ta vẫn saveCredentials()
      event.context.push(AppRoutes.navigation);
    } else {
      print("Tên đăng nhập hoặc mật khẩu sai");
      emit(state.copyWith(loginError: "Tên đăng nhập hoặc mật khẩu sai"));
    }

    on<ChooseLanguage>((event, emit) {
      final FlutterLocalization _localization = FlutterLocalization.instance;
      _localization.translate(event.languageId);

      SharedPrefUtils.setLanguageId(event.languageId);

      emit(state.copyWith(languageId: event.languageId));
    });

    on<GetInitialData>((event, emit) async {
      // Load data when the Bloc is initialized
      String languageId = await SharedPrefUtils.getLanguageId() ?? 'vi';

      emit(state.copyWith(languageId: languageId));
    });

    // Get Initial Data
    add(GetInitialData());
  }
}