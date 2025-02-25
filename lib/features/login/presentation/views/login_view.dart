import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vnpt_his/core/services/biometric_auth_service.dart';
import 'package:vnpt_his/core/services/credential_storage_service.dart';
import 'package:vnpt_his/features/login/presentation/bloc/login_bloc.dart';
import 'package:vnpt_his/routes/app_routes.dart';
import '../../../../gen/assets.gen.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // Danh sách bệnh viện mẫu (có thể thay bằng dữ liệu lấy từ API)
  final List<String> _hospitalList = [
    "Bệnh viện Bưu Điện",
    "NAN - TTYT huyện Nghĩa Đàn",
    "Trạm Y tế Kim Hỷ",
    "HDG - TTYT Huyện Ninh Giang",
    "HDG - TTYT Huyện Tứ Kỳ",
    "Bệnh viện Đa Khoa Bưu Điện HCM",
    "Trung tâm y tế huyện Lạc Dương",
    "Bệnh viện YHCT Bảo Lộc",
    "Trạm y tế xã Nghi Liên",
    "PK đa khoa Tâm An Bình lục",
  ];

  // Biến lưu tên bệnh viện đã chọn. Nếu chưa chọn => hiển thị hint "Chọn bệnh viện"
  String? _selectedHospital;

  // GlobalKey dùng để xác định vị trí của widget chọn bệnh viện (để tính toán Overlay)
  final GlobalKey _hospitalFieldKey = GlobalKey();

  // Biến lưu trữ OverlayEntry hiển thị danh sách bệnh viện
  OverlayEntry? _hospitalListOverlay;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // LoginBloc được khởi tạo với CredentialStorage và BiometricAuthHelper theo DI (các file đặt ở core)
      create: (_) => LoginBloc(
        credentialStorage: CredentialStorage(),
        biometricAuthHelper: BiometricAuthHelper(),
      ),
      child: Scaffold(
        body: Stack(
          children: [
            // Ảnh nền full màn hình
            Positioned.fill(
              child: Image.asset(
                Assets.images.login.icBgLogin.path,
                fit: BoxFit.cover,
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 24,
                      ),
                      child: BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const SizedBox(height: 200),
                              // Widget chọn tên bệnh viện
                              _buildHospitalSelector(),
                              const SizedBox(height: 30),
                              // Input tài khoản
                              _buildUsernameField(context, state),
                              const SizedBox(height: 20),
                              // Input mật khẩu
                              _buildPasswordField(context, state),
                              const SizedBox(height: 10),
                              // Checkbox ghi nhớ mật khẩu
                              _buildRememberMe(context, state),
                              const SizedBox(height: 30),
                              // Nút đăng nhập
                              _buildLoginButton(context, state),
                              const SizedBox(height: 20),
                              // Icon đăng nhập sinh trắc học (FaceID/TouchID)
                              _buildBiometricIcon(context),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  // Thông tin phiên bản hiển thị ở dưới cùng
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      "Phiên bản 2.16.2",
                      style: TextStyle(
                        color: Colors.white70,
                        fontStyle: FontStyle.italic,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Widget chọn "Tên bệnh viện"
  /// - Không dùng TextField để tránh InputDecoration mặc định.
  /// - Hiển thị hint "Chọn bệnh viện" (màu xám) nếu chưa chọn, và hiển thị tên đã chọn (màu đen).
  /// - Chiều rộng cố định: width = double.infinity (bằng với các widget khác).
  Widget _buildHospitalSelector() {
    final displayText = (_selectedHospital != null && _selectedHospital!.isNotEmpty)
        ? _selectedHospital!
        : "Chọn bệnh viện";
    final displayStyle = (_selectedHospital != null && _selectedHospital!.isNotEmpty)
        ? const TextStyle(color: Colors.black, fontSize: 16)
        : const TextStyle(color: Colors.grey, fontSize: 16);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Tên bệnh viện",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        const SizedBox(height: 4),
        GestureDetector(
          key: _hospitalFieldKey,
          onTap: () {
            if (_hospitalListOverlay == null) {
              _showHospitalListOverlay();
            } else {
              _hideHospitalListOverlay();
            }
          },
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Text(displayText, style: displayStyle),
          ),
        ),
      ],
    );
  }

  /// Hiển thị Overlay danh sách bệnh viện (đè lên giao diện mà không đẩy các widget khác)
  void _showHospitalListOverlay() {
    final overlay = Overlay.of(context);
    if (overlay == null) return;
    final RenderBox renderBox =
        _hospitalFieldKey.currentContext?.findRenderObject() as RenderBox;
    final Size size = renderBox.size;
    final Offset offset = renderBox.localToGlobal(Offset.zero);

    _hospitalListOverlay = OverlayEntry(
      builder: (context) {
        return Positioned(
          left: offset.dx,
          top: offset.dy + size.height,
          width: size.width,
          child: Material(
            elevation: 4.0,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 200),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _hospitalList.length,
                itemBuilder: (context, index) {
                  final hospital = _hospitalList[index];
                  return ListTile(
                    title: Text(hospital),
                    onTap: () {
                      setState(() {
                        _selectedHospital = hospital;
                      });
                      _hideHospitalListOverlay();
                    },
                  );
                },
              ),
            ),
          ),
        );
      },
    );

    overlay.insert(_hospitalListOverlay!);
  }

  void _hideHospitalListOverlay() {
    _hospitalListOverlay?.remove();
    _hospitalListOverlay = null;
  }

  /// Input tài khoản
  Widget _buildUsernameField(BuildContext context, LoginState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Tài khoản",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        const SizedBox(height: 4),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            onChanged: (value) =>
                context.read<LoginBloc>().add(UsernameChanged(value)),
            decoration: InputDecoration(
              hintText: "Nhập tài khoản",
              hintStyle: const TextStyle(color: Colors.grey),
              errorText: state.usernameError,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Input mật khẩu
  Widget _buildPasswordField(BuildContext context, LoginState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Mật khẩu",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        const SizedBox(height: 4),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            obscureText: true,
            onChanged: (value) =>
                context.read<LoginBloc>().add(PasswordChanged(value)),
            decoration: InputDecoration(
              hintText: "Nhập mật khẩu",
              hintStyle: const TextStyle(color: Colors.grey),
              errorText: state.passwordError,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Checkbox "Ghi nhớ mật khẩu"
  Widget _buildRememberMe(BuildContext context, LoginState state) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            context.read<LoginBloc>().add(RememberMeChanged(!state.rememberMe));
          },
          child: Image.asset(
            state.rememberMe
                ? Assets.images.login.icCheckedButton.path
                : Assets.images.login.icUncheckButton.path,
            width: 24,
            height: 24,
          ),
        ),
        const SizedBox(width: 8),
        const Text(
          "Ghi nhớ mật khẩu",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ],
    );
  }

  /// Nút "ĐĂNG NHẬP"
  Widget _buildLoginButton(BuildContext context, LoginState state) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(48),
        backgroundColor: const Color(0xFF0059C8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: () {
        context.read<LoginBloc>().add(LoginSubmitted(context));
      },
      child: const Text(
        "ĐĂNG NHẬP",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  /// Icon đăng nhập sinh trắc học (FaceID/TouchID)
  Widget _buildBiometricIcon(BuildContext context) {
    return Center(
      child: IconButton(
        onPressed: () {
          context.read<LoginBloc>().add(BiometricLoginEvent(context));
        },
        icon: Image.asset(
          Assets.images.login.icFaceId.path,
          width: 36,
          height: 36,
        ),
      ),
    );
  }
}