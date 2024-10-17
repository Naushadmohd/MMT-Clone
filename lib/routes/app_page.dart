import 'package:avoota/routes/app_route.dart';
import 'package:avoota/views/authentication/otp_screen.dart';
import 'package:get/get.dart';

import '../views/authentication/login_screen.dart';
import '../views/authentication/splash_screen.dart';

class AppPages {
  static final routes = [
    ///login Module
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => SplashScreen(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: AppRoutes.loginScreen,
      page: () => LoginScreen(),
      transition: Transition.rightToLeftWithFade,
    ),
//     GetPage(
//       name: AppRoutes.typeOfloginScreen,
//       page: () => TypeOfLoginScreen(),
//       transition: Transition.rightToLeftWithFade,
//     ),
//     GetPage(
//       name: AppRoutes.frsIntegrationScreen,
//       page: () => FrsIntegrationScreen(),
//       transition: Transition.rightToLeftWithFade,
//     ),
//     GetPage(
//       name: AppRoutes.forgotPasswordScreen,
//       page: () => ForgotPasswordScreen(),
//       transition: Transition.rightToLeftWithFade,
//     ),
    GetPage(
      name: AppRoutes.otpScreen,
      page: () => OtpScreen(),
      transition: Transition.rightToLeftWithFade,
    ),
//     GetPage(
//       name: AppRoutes.resetPasswordScreen,
//       page: () => ResetPasswordScreen(),
//       transition: Transition.rightToLeftWithFade,
//     ),
//     GetPage(
//         name: AppRoutes.getStartScreen,
//         page: () => GetStartScreen(),
//         transition: Transition.rightToLeftWithFade),

// // btn screens
//     GetPage(
//       name: AppRoutes.btmNavigationScreen,
//       page: () => BottomNavigationScreen(),
//       transition: Transition.rightToLeftWithFade,
//     ),
//     GetPage(
//       name: AppRoutes.leaveHistoryScreen,
//       page: () => LeaveHistoryScreen(),
//       transition: Transition.rightToLeftWithFade,
//     ),
//     GetPage(
//       name: AppRoutes.notificationScreen,
//       page: () => NotificationsScreen(),
//       transition: Transition.rightToLeftWithFade,
//     ),
//     GetPage(
//       name: AppRoutes.applyLeavesScreen,
//       page: () => ApplyLeavesScreen(),
//       transition: Transition.rightToLeftWithFade,
//     ),
//     GetPage(
//         name: AppRoutes.createWorkLogScreen, page: () => CreateWorkLogScreen()),

// //profile screens
//     GetPage(
//       name: AppRoutes.profileScreen,
//       page: () => ProfileScreen(),
//       transition: Transition.rightToLeftWithFade,
//     ),
//     GetPage(
//       name: AppRoutes.editProfileScreen,
//       page: () => EditProfileScreen(),
//       transition: Transition.rightToLeftWithFade,
//     ),
//     GetPage(
//       name: AppRoutes.changePasswordScreen,
//       page: () => ChangePasswordScreen(),
//       transition: Transition.rightToLeftWithFade,
//     ),
//     GetPage(
//       name: AppRoutes.FaceDetectionScreenCheckInOut,
//       page: () => FaceDetectionScreenCheckInOut(),
//       transition: Transition.rightToLeftWithFade,
//     ),
//     GetPage(
//       name: AppRoutes.TakeBreakCamera,
//       page: () => TakeBreakCamera(),
//       transition: Transition.rightToLeftWithFade,
//     ),
  ];
  //
}
