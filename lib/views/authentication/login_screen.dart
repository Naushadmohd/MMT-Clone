import 'package:avoota/components/cButton.dart';
import 'package:avoota/components/cText_Style.dart';
import 'package:avoota/components/cTextformField.dart';
import 'package:avoota/constants/color_constant.dart';
import 'package:avoota/constants/image_constant.dart';
import 'package:avoota/routes/app_route.dart';
import 'package:avoota/utils/display_utils.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/regex_util.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(_updateButtonColor);
  }

  @override
  void dispose() {
    _phoneController.removeListener(_updateButtonColor);
    _phoneController.dispose();
    super.dispose();
  }

  bool _isPhoneNumberEmpty = true;

  void _updateButtonColor() {
    setState(() {
      _isPhoneNumberEmpty = _phoneController.text.isEmpty;
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
                Positioned(
                  right: 0,
                  top: 50,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Skip",
                      style: TextStyles.getSubTita14(
                          textColor: cBlackColor, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
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
                      'Unlock Your Perfect Stay',
                      style: TextStyles.getSubTital20(textColor: cBlackColor),
                    ),
                    vGap(10),
                    Text(
                      'Sign in for personalized deals and hassle-free bookings',
                      style: TextStyles.getSubTita13(textColor: cGrayColor),
                    ),
                    vGap(10),
                    Row(
                      children: [
                        hGap(10),
                        Flexible(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: cTextfeildBdrColor),
                            ),
                            child: CountryCodePicker(
                              enabled: true,
                              onChanged: print,
                              initialSelection: 'IN',
                              favorite: ['+91', 'ENG'],
                              showFlag: true,
                              flagWidth: 30,
                              closeIcon: Icon(Icons.keyboard_arrow_down),
                              showCountryOnly: true,
                              showOnlyCountryWhenClosed: false,
                              alignLeft: false,
                            ),
                          ),
                        ),
                        hGap(10),
                        Flexible(
                          flex: 2,
                          child: CTextFormField(
                            controller: _phoneController,
                            hintText: "Mobile Number",
                          ),
                        ),
                      ],
                    ),
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
                                  message: "Please enter mobile number",
                                  textColor: cWhiteColor);
                            } else if (checkNumbervalidation(
                                _phoneController.text)) {
                              GetXErrorSnackbar.showErrorSnackbar(
                                  position: SnackPosition.TOP,
                                  backgroundColor: cRedColor.withOpacity(0.40),
                                  title: "Error",
                                  message: "Please enter valid mobile number",
                                  textColor: cWhiteColor);
                            } else {
                              GetXSnackbar.showSuccessSnackbar(
                                  position: SnackPosition.TOP,
                                  backgroundColor:
                                      cGreenColor.withOpacity(0.40),
                                  title: "Success",
                                  message:
                                      "OTP sent Successfully to ${_phoneController.text} Number",
                                  textColor: cWhiteColor);
                              Get.toNamed(AppRoutes.otpScreen);
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
}
