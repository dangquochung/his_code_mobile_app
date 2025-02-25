class User {
  final String hoTen;
  final String gioiTinh;
  final String ngaySinh;
  final String soDienThoai;
  final String diaChi;

  User({
    required this.hoTen,
    required this.gioiTinh,
    required this.ngaySinh,
    required this.soDienThoai,
    required this.diaChi,
  });

  Map<String, dynamic> toJson() {
    return {
      "hoTen": hoTen,
      "gioiTinh": gioiTinh,
      "ngaySinh": ngaySinh,
      "soDienThoai": soDienThoai,
      "diaChi": diaChi,
    };
  }
}