import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vnpt_his/features/product/data/models/product_model.dart';
import 'package:vnpt_his/gen/assets.gen.dart';

class ProductState {
  final int sample;
  final List<ProductModel> listProducts = [
    ProductModel(
      title: "Quản lý tiếp đón",
      imagePath: Assets.images.product.icQuanLyTiepDon.path,
      description:
          "Đăng kí khám, quản lý danh sách bệnh nhân nhanh chóng, thuận tiện. Hỗ trợ chăm sóc khách hàng, đặt hẹn, thu phí, chỉ định CLS...",
    ),
    ProductModel(
      title: "Quản lý khám bệnh",
      imagePath: Assets.images.product.icQuanLyKhamBenh.path,
      description:
      "Ghi nhận đầy đủ thông tin khám. Kê đơn thuốc nhanh chóng, thuận tiện Quản lý các phiếu chỉ định CLS đầy đủ, khoa học",
    ),
    ProductModel(
      title: "Quản lý viện phí",
      imagePath: Assets.images.product.icQuanLyVienPhi.path,
      description:
      "Tự động tính chi phí khám, CLS, thuốc... Thu tiền thuận tiện, chính xác, xuất HDDT. Báo cáo chi tiết, minh bạch, quản lý trực tuyến",
    ),
    ProductModel(
      title: "Quản lý Cận lâm sàng",
      imagePath: Assets.images.product.icQuanLyCanLamSang.path,
      description:
      "Thực hiện XN, CĐHA, PTTT. Kết nối VNPT LIS. Trả kết quả cho Bác sĩ nhanh chóng.",
    ),
    ProductModel(
      title: "Quản lý Bán thuốc",
      imagePath: Assets.images.product.icQuanLyBanThuoc.path,
      description:
      "Nhập kho, xuất thuốc bệnh nhân, bán lẻ thuốc an toàn, chính xác",
    ),
    ProductModel(
      title: "Chăm sóc khách hàng",
      imagePath: Assets.images.product.icChamSocKhachHang.path,
      description:
      "Thực hiện XN, CĐHA, PTTT. Kết nối VNPT LIS. Trả kết quả cho Bác sĩ nhanh chóng.",
    ),
    ProductModel(
      title: "Báo cáo",
      imagePath: Assets.images.product.icBaoCao.path,
      description:
      "Báo cáo đẩy đủ, chi tiết, chính xác, linh động",
    ),
  ];

  ProductState({
    this.sample = 0,
  });

  ProductState copyWith({
    int? sample,
  }) {
    return ProductState(
      sample: sample ?? this.sample,
    );
  }
}

abstract class ProductEvent {}

class SampleEvent extends ProductEvent {
  final BuildContext context;

  SampleEvent(this.context);
}

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductState()) {
    on<SampleEvent>((event, emit) {
      emit(state.copyWith(sample: 1));
    });
  }
}
