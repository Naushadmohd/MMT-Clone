import 'package:avoota/components/cButton.dart';
import 'package:avoota/components/cText_Style.dart';
import 'package:avoota/constants/color_constant.dart';
import 'package:avoota/constants/image_constant.dart';
import 'package:avoota/utils/display_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';

import '../../routes/app_route.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({super.key});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _otpController.addListener(_updateButtonColor);
  }

  @override
  void dispose() {
    _otpController.removeListener(_updateButtonColor);
    _otpController.dispose();
    super.dispose();
  }

  bool _isPhoneNumberEmpty = true;

  void _updateButtonColor() {
    setState(() {
      _isPhoneNumberEmpty = _otpController.text.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBgColor2,
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Stack(
              children: [
                // Positioned(
                //   right: 0,
                //   top: 50,
                //   child: TextButton(
                //     onPressed: () {},
                //     child: Text(
                //       "Skip",
                //       style: TextStyles.getSubTita14(
                //           textColor: cBlackColor, fontWeight: FontWeight.w500),
                //     ),
                //   ),
                // ),
                Image.asset(
                  ImageConstants.hotelPng,
                  scale: 3.5,
                ),
              ],
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                width: getWidth(context),
                height: getHeight(context),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 3),
                        blurRadius: 2.2,
                        spreadRadius: 0.4)
                  ],
                  color: cWhiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Verify Your Identity',
                      style: TextStyles.getSubTital20(textColor: cBlackColor),
                    ),
                    vGap(10),
                    Text(
                      'Enter the code we sent to your mobile number to complete the process',
                      style: TextStyles.getSubTita13(textColor: cGrayColor),
                    ),
                    vGap(10),
                    _otpFeild(),
                    vGap(20),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0.5, 0),
                                blurRadius: 2.2,
                                spreadRadius: 0)
                          ],
                        ),
                        child: CButton(
                          height: 45,
                          width: getWidth(context) / 1.1,
                          onPressed: () {
                            if (_isPhoneNumberEmpty) {
                              GetXErrorSnackbar.showErrorSnackbar(
                                  position: SnackPosition.TOP,
                                  backgroundColor: cRedColor.withOpacity(0.40),
                                  title: "Error",
                                  message: "Please enter OTP",
                                  textColor: cWhiteColor);
                            } else {
                              Get.toNamed(AppRoutes.loginScreen);
                            }
                          },
                          borderRadius: 10.0,
                          color: _isPhoneNumberEmpty ? cGrayColor : cRedColor,
                          text: Text(
                            "Confirm",
                            style: TextStyles.getSubTita16(
                              textColor: cWhiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    vGap(30),
                    Image.asset(
                      ImageConstants.orIconPng,
                      scale: 3.5,
                    ),
                    vGap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          ImageConstants.googleIconPng,
                          scale: 5,
                        ),
                        hGap(10),
                        Image.asset(
                          ImageConstants.appleIconPng,
                          scale: 5,
                        ),
                      ],
                    ),
                    vGap(5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'By proceeding you agree to Avoota’s',
                              style: TextStyles.getSubTita12(
                                  textColor: cGrayColor),
                            ),
                            Text(
                              '  Privacy Policy,',
                              style:
                                  TextStyles.getSubTita12(textColor: cBgColor),
                            ),
                          ],
                        ),
                        Text(
                          ' User Agreement, T&C’s.',
                          style: TextStyles.getSubTita12(textColor: cBgColor),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _otpFeild() {
    return Center(
      child: SizedBox(
        width: getWidth(context) / 1.2,
        child: PinCodeTextField(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp("[0-9]")),
            LengthLimitingTextInputFormatter(6),
          ],
          appContext: context,
          pastedTextStyle: TextStyle(
            color: cBlackColor,
            fontWeight: FontWeight.normal,
          ),
          length: 6,
          obscureText: false,
          cursorHeight: 17,
          blinkWhenObscuring: true,
          animationType: AnimationType.fade,
          pinTheme: PinTheme(
            inactiveBorderWidth: 0.5,
            borderWidth: 0.5,
            shape: PinCodeFieldShape.box,
            activeColor: cTextfeildBdrColor,
            selectedColor: cTextfeildBdrColor,
            selectedFillColor: cWhiteColor,
            activeFillColor: cWhiteColor,
            inactiveFillColor: cWhiteColor,
            inactiveColor: cTextfeildBdrColor,
            borderRadius: BorderRadius.circular(6),
            fieldHeight: 11.w,
            fieldWidth: 11.w,
          ),
          cursorColor: cBlackColor,
          animationDuration: Duration(milliseconds: 300),
          enableActiveFill: true,
          controller: _otpController,
          keyboardType: TextInputType.number,
        ),
      ),
    );
  }
}
