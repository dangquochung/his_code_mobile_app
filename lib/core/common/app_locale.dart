mixin AppLocale {
  static const String welcome = 'welcome';
  static const String usernameHint = 'usernameHint';
  static const String passwordHint = 'passwordHint';
  static const String savePassword = 'savePassword';
  static const String forgotPassword = 'forgotPassword';
  static const String signIn = 'signIn';
  static const String signUp = 'signUp';
  static const String product = 'product';
  static const String aboutUs = 'aboutUs';
  static const String news = 'news';
  static const String helloDoctor = 'helloDoctor';
  static const String search = 'search';
  static const String seeAll = 'seeAll';
  static const String todayAppointment = 'todayAppointment';
  static const String mainFeature = 'mainFeature';
  static const String changeLang = 'changeLang';
  static const String clinic = 'clinic';
  static const String day = 'day';
  static const String month = 'month';
  static const String year = 'year';
  static const String category = 'category';
  static const String settings = 'settings';
  static const String availabilityStatus = 'availabilityStatus';
  static const String notification = 'notification';
  static const String darkMode = 'darkMode';
  static const String account = 'account';
  static const String updateProfile = 'updateProfile';
  static const String updateBio = 'updateBio';
  static const String changePassword = 'changePassword';
  static const String language = 'language';
  static const String privacyPolicy = 'Privacy policy';
  static const String signOut = 'signOut';
  static const String noNotification = 'noNotification';
  static const String aboutUsContact = 'aboutUsContact';
  static const String aboutUsCskh = 'aboutUsCskh';
  static const String aboutUsCskhDes = 'aboutUsCskhDes';
  static const String sendInfo = 'sendInfo';
  static const String fullName = 'fullName';
  static const String phoneNumber = 'phoneNumber';
  static const String email = 'email';
  static const String address = 'address';
  static const String content = 'content';
  static const String invalidEmailWarning = 'invalidEmailWarning';
  static const String cancel = 'cancel';
  static const String send = 'send';
  static const String pleaseEnter = 'pleaseEnter';

  static const Map<String, dynamic> VI = {
    welcome: 'Chào mừng đến với VNPT Home&Clinic',
    usernameHint: 'Nhập tên đăng nhập',
    passwordHint: 'Nhập mật khẩu',
    savePassword: 'Lưu mật khẩu',
    forgotPassword: 'Quên mật khẩu',
    signIn: 'Đăng nhập',
    signUp: 'Bạn chưa có tài khoản. Đăng ký ngay!',
    product: 'Sản phẩm',
    aboutUs: 'Về chúng tôi',
    news: 'Tin tức',
    helloDoctor: 'Xin chào Bác sĩ,',
    search: 'Tìm kiếm',
    seeAll: 'Xem tất cả',
    todayAppointment: 'Lịch hẹn khám hôm nay',
    mainFeature: 'Tính năng chính',
    changeLang: 'Đổi ngôn ngữ',
    clinic: 'Phòng khám',
    day: 'Ngày',
    month: 'Tháng',
    year: 'Năm',
    category: 'Danh mục',
    settings: 'Cài đặt',
    availabilityStatus: 'Trạng thái khả dụng',
    notification: 'Thông báo',
    darkMode: 'Chế độ đêm',
    account: 'Tài khoản',
    updateProfile: 'Cập nhật hồ sơ',
    updateBio: 'Cập nhật tiểu sử',
    changePassword: 'Đổi mật khẩu',
    language: 'Ngôn ngữ',
    privacyPolicy: 'Chính sách quyền riêng tư',
    signOut: 'Đăng xuất',
    noNotification: 'Không có thông báo',
    aboutUsContact: 'Bạn cần thêm thông tin, vui lòng gọi tới:',
    aboutUsCskh: 'Hỗ trợ khách hàng',
    aboutUsCskhDes:
        'Trung tâm hỗ trợ khách hàng giúp giải đáp mọi thắc mắc về dịch vụ và giải pháp của VNPT',
    sendInfo: 'Gửi thông tin',
    fullName: 'Họ và tên',
    phoneNumber: 'Số điện thoại',
    email: 'Email',
    address: 'Địa chỉ',
    content: 'Nội dung',
    invalidEmailWarning: 'Vui lòng nhập email hợp lệ',
    cancel: 'Hủy',
    send: 'Gửi',
    pleaseEnter: 'Vui lòng nhập',
  };

  static const Map<String, dynamic> EN = {
    welcome: 'Welcome to VNPT Home&Clinic',
    usernameHint: 'Enter your username',
    passwordHint: 'Enter your password',
    savePassword: 'Save password',
    forgotPassword: 'Forgot password',
    signIn: 'Login',
    signUp: 'Haven\'t had an account. Register now!',
    product: 'Product',
    aboutUs: 'About us',
    news: 'News',
    helloDoctor: 'Hello Doctor,',
    search: 'Search',
    seeAll: 'See all',
    todayAppointment: 'Today\' appointments',
    mainFeature: 'Features',
    changeLang: 'Change language',
    clinic: 'Clinic',
    day: 'Day',
    month: 'Tháng',
    year: 'Năm',
    category: 'Category',
    settings: 'Settings',
    availabilityStatus: 'Availability status',
    notification: 'Notification',
    darkMode: 'Night mode',
    account: 'Account',
    updateProfile: 'Update profile',
    updateBio: 'Update bio',
    changePassword: 'Change password',
    language: 'Language',
    privacyPolicy: 'Privacy policy',
    signOut: 'Sign out',
    noNotification: 'There are no notifications!',
    aboutUsContact: 'If you need more information, please call:',
    aboutUsCskh: 'Customer support',
    aboutUsCskhDes:
        'The customer support center helps answer all questions about VNPT\'s services and solutions',
    sendInfo: 'Send information',
    fullName: 'Full name',
    phoneNumber: 'Phone number',
    email: 'Email',
    address: 'Address',
    content: 'Content',
    invalidEmailWarning: 'Please enter a valid email',
    cancel: 'Cancel',
    send: 'Send',
    pleaseEnter: 'Please enter your',
  };
}

class LanguageModel {
  final String id;
  final String title;
  final String iconPath;

  LanguageModel(
      {required this.id, required this.title, required this.iconPath});

  static List<LanguageModel> listLanguages = [
    LanguageModel(
        id: "vi",
        title: "Tiếng Việt",
        iconPath: "assets/images/login/ic_vi.png"),
    LanguageModel(
        id: "en",
        title: "Tiếng Anh",
        iconPath: "assets/images/login/ic_en.png"),
  ];
}