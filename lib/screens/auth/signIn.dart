import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/route_manager.dart';
import 'package:turgent/apis/auth.dart';
import 'package:turgent/apis/fireStore.dart';
import 'package:turgent/components/customButton.dart';
import 'package:turgent/components/entryField.dart';
import 'package:turgent/components/snackbar.dart';
import 'package:turgent/screens/auth/signUp.dart';
import 'package:turgent/screens/onlineAgent.dart';

class SignInUI extends StatefulWidget {
  @override
  _SignInUIState createState() => _SignInUIState();
}

class _SignInUIState extends State<SignInUI> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Stack(children: [
                Image.asset(
                  'assets/shopping.jpg',
                  scale: 1,
                  height: MediaQuery.of(context).size.height * 0.40,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
                PositionedDirectional(
                  top: 40,
                  start: 40,
                  end: 0,
                  child: Text(
                    "SIGN IN",
                    style: theme.textTheme.headline6,
                  ),
                ),
              ]),
              SizedBox(
                height: 50,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    EntryField(
                      controller: emailController,
                      label: "Email address",
                      obscureText: false,
                      borderRadiusTopRight: Radius.circular(12),
                      borderRadiusTopLeft: Radius.circular(12),
                      keyBoardType: TextInputType.emailAddress,
                      validator: FormBuilderValidators.email(context,
                          errorText: 'Incorrect email format'),
                      // initialValue: 'george@mail.com',
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
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              _isLoading
                  ? Container(
                      color: Colors.white12,
                      child: Center(
                        child: CircularProgressIndicator.adaptive(
                          backgroundColor: Colors.green,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                    )
                  : CustomButton(
                      height: 50,
                      onTap: () {
                        if (_formKey.currentState.validate()) {
                          setState(() => _isLoading = true);

                          signIn(
                            email: emailController.value.text,
                            password: passwordController.value.text,
                          ).then((value) => setState(() => _isLoading = false));
                        } else {
                          showCustomSnackBar('Please fill form correctly');
                        }
                      },
                      label: "Login",
                      labelStyle: theme.textTheme.headline6,
                    ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: Row(
                  children: [
                    Text(
                      "New user? ",
                      style: theme.textTheme.caption,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(
                          () => SignUpUI(),
                        );
                        // Navigator.pushNamed(context, PageRoutes.signUp);
                      },
                      child: Text(
                        "Sign up",
                        style: theme.textTheme.caption.copyWith(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Forgot ',
                      style: theme.textTheme.caption,
                    ),
                    GestureDetector(
                      onTap: () => FireStoreStorage().addUser(),
                      child: Text(
                        "Password ?",
                        style: theme.textTheme.caption.copyWith(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
