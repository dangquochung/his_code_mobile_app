import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/biometric_auth_bloc.dart';
import '../bloc/biometric_auth_event.dart';
import '../bloc/biometric_auth_state.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class BiometricAuthPage extends StatelessWidget {
  const BiometricAuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocProvider.of<BiometricAuthBloc>(context),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Xác thực sinh trắc học'),
        ),
        body: BlocConsumer<BiometricAuthBloc, BiometricAuthState>(
          listener: (context, state) {
            if (state is BiometricFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          builder: (context, state) {
            if (state is BiometricLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is BiometricAuthenticated) {
              // Hiển thị file PDF thật từ thiết bị
              return PDFView(
                filePath: state.secureFile.filePath,
                enableSwipe: true,
                swipeHorizontal: false,
                autoSpacing: true,
                pageFling: true,
                onRender: (pages) => print("PDF Rendered with $pages pages"),
                onError: (error) => print("PDF Error: $error"),
                onPageError: (page, error) => print("PDF Page Error: $error"),
              );
            } else {
              return Center(
                child: ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<BiometricAuthBloc>(context)
                        .add(AuthenticateEvent());
                  },
                  child: const Text('Xác thực bằng sinh trắc học'),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
