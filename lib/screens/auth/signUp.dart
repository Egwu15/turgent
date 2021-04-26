import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/route_manager.dart';
import 'package:turgent/apis/auth.dart';
import 'package:turgent/components/customButton.dart';
import 'package:turgent/components/entryField.dart';
import 'package:turgent/components/snackbar.dart';
import 'package:turgent/screens/auth/signIn.dart';

class SignUpUI extends StatefulWidget {
  @override
  _SignUpUIState createState() => _SignUpUIState();
}

class _SignUpUIState extends State<SignUpUI> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              Image.asset(
                'assets/shopping.jpg',
                height: MediaQuery.of(context).size.height * 0.40,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
              PositionedDirectional(
                top: 40,
                start: 16,
                end: 0,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: theme.scaffoldBackgroundColor,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "SIGN UP",
                      style: theme.textTheme.headline6,
                    )
                  ],
                ),
              ),
            ]),
            SizedBox(
              height: 10,
            ),
            // Row(
            //   children: [

            //     Expanded(
            //       flex: 3,
            //       child: Column(
            //         children: [

            Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    EntryField(
                      obscureText: false,
                      controller: fullNameController,
                      label: "Full Name",
                      borderRadiusTopLeft: Radius.circular(12),
                      borderRadiusTopRight: Radius.circular(12),
                      validator: FormBuilderValidators.minLength(context, 6,
                          errorText: "at least 5 letters"),
                    ),
                    EntryField(
                      obscureText: false,
                      controller: emailController,
                      label: "Email Address",
                      keyBoardType: TextInputType.emailAddress,
                      validator: FormBuilderValidators.email(context,
                          errorText: 'Incorrect email format'),
                      // initialValue: 'george@mail.com',
                    ),
                    EntryField(
                      obscureText: false,
                      controller: phoneNumberController,
                      label: "Phone Number",
                      keyBoardType: TextInputType.number,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.minLength(context, 10,
                            errorText: "Not up to 10 characters")
                      ]),
                    ),
                    EntryField(
                      controller: passwordController,
                      label: "Password",
                      obscureText: true,
                      // initialValue: '*  *  *  *  *',
                      borderRadiusBottomLeft: Radius.circular(12),
                      borderRadiusBottomRight: Radius.circular(12),
                      validator: FormBuilderValidators.minLength(context, 5,
                          errorText: "5 dights at least"),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                )), //         ],
            //       ),
            //     ),
            //   ],
            // ),

            _isLoading
                ? Container(
                    color: Colors.white12,
                    child: Center(
                      child: CircularProgressIndicator.adaptive(
                        backgroundColor: Colors.green,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                  )
                : CustomButton(
                    height: 50,
                    onTap: () {
                      // Navigator.pushNamed(context, PageRoutes.verification);
                      if (_formKey.currentState.validate()) {
                        setState(() => _isLoading = true);

                        signUp(
                                email: emailController.value.text,
                                name: fullNameController.value.text,
                                password: passwordController.value.text,
                                phoneNumber: phoneNumberController.value.text)
                            .then(
                                (value) => setState(() => _isLoading = false));
                      } else {
                        showCustomSnackBar('Please fill form correctly');
                      }
                    },
                    label: "Sign up now",
                    labelStyle: theme.textTheme.headline6,
                  ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already registered ?",
                    style: theme.textTheme.bodyText1,
                  ),
                  GestureDetector(
                    onTap: () => Get.to(
                      () => SignInUI(),
                    ),
                    child: Text(
                      "Sign in",
                      style: theme.textTheme.bodyText2.copyWith(
                          color: theme.primaryColor,
                          fontWeight: FontWeight.bold),
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
}
