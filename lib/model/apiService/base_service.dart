class BaseService {

  final String baseURL = 'https://zuraapi.comuniqate.com/';

  /// =============== AUTH APIS ================= ///

  final String sendOtp = "api/customer/auth/send-code";
  final String reSendOtp = "api/customer/auth/resend-code";
  final String verifyOtp = "api/customer/auth/verify-code";
  final String  updateProfile = "api/customer/auth/update-profile";
  final String socialLogin = "api/customer/auth/social-login";

  ///  ==================  Home APIs ====================== ///

  final String  homePage = "api/customer/home-page";
  static String  categoryImage = "https://zuraapi.comuniqate.com/assets/uploads/category/image-1706163313543.png";
  static String  bannerImage = "https://zuraapi.comuniqate.com/assets/uploads/banner/image-1706163449654.png";

}