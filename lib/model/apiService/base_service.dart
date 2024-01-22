 class BaseService {

  final String baseURL = 'https://zuraapi.comuniqate.com/';

  /// =============== AUTH APIS ================= ///

  final String sendOtp ="api/customer/auth/send-code";
  final String reSendOtp ="api/customer/auth/resend-code";
  final String verifyOtp ="api/customer/auth/verify-code";

  /// =============== STORE ================= ///
  // final String store="api/customer/auth/store";


}
