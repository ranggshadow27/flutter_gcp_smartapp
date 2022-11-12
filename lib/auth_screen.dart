import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_auth_animation/constants.dart';
import 'package:flutter_auth_animation/widgets/login_form.dart';
import 'package:flutter_auth_animation/widgets/sign_up_form.dart';
import 'package:flutter_auth_animation/widgets/socal_buttons.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  bool _isShowSignUp = false;

  late AnimationController _animationController;
  late Animation<double> _animationTextRotate;

  void setUpAnimation() {
    _animationController =
        AnimationController(vsync: this, duration: defaultDuration);

    _animationTextRotate =
        Tween<double>(begin: 0, end: 90).animate(_animationController);
  }

  void updateView() {
    setState(() {
      _isShowSignUp = !_isShowSignUp;
    });
    _isShowSignUp
        ? _animationController.forward()
        : _animationController.reverse();
  }

  @override
  void initState() {
    setUpAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AnimatedBuilder(
          animation: _animationController,
          builder: (context, _) {
            return Stack(
              children: [
                //Login
                AnimatedPositioned(
                  duration: defaultDuration,
                  width: _size.width * 0.88,
                  height: _size.height,
                  left: _isShowSignUp ? -_size.width * 0.76 : 0,
                  child: Container(
                    color: login_bg,
                    child: LoginForm(),
                  ),
                ),

                //SignUp
                AnimatedPositioned(
                  duration: defaultDuration,
                  height: _size.height,
                  width: _size.width * 0.88,
                  left: _isShowSignUp ? _size.width * 0.12 : _size.width * 0.88,
                  child: Container(
                    color: signup_bg,
                    child: SignUpForm(),
                  ),
                ),

                AnimatedPositioned(
                  duration: defaultDuration,
                  bottom: 0,
                  left: 0,
                  right:
                      _isShowSignUp ? -_size.width * 0.06 : _size.width * 0.12,
                  child: _isShowSignUp
                      ? Image.asset(
                          'assets/gcpt_2.png',
                          height: 200,
                        )
                      : Image.asset(
                          'assets/gcpt.png',
                          height: 200,
                        ),
                ),
                // AnimatedPositioned(
                //   duration: defaultDuration,
                //   width: _size.width,
                //   bottom: _size.height * 0.1,
                //   right:
                //       _isShowSignUp ? -_size.width * 0.06 : _size.width * 0.06,
                //   child: Text(
                //     'GRIYA CIBINONG PERMAI SMARTAPP \nCOPYRIGHT 2022',
                //     textAlign: TextAlign.center,
                //     style: TextStyle(
                //       color: signup_bg,
                //       fontSize: 10,
                //     ),
                //   ),
                // ),

                AnimatedPositioned(
                  duration: defaultDuration,
                  top: _isShowSignUp
                      ? _size.height / 1 - (_size.height / 2.5)
                      : _size.height * 0.07,
                  left: _isShowSignUp ? 0 : _size.width * 0.44 - 80,
                  child: AnimatedDefaultTextStyle(
                    duration: defaultDuration,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: _isShowSignUp ? 20 : 32,
                      fontWeight: FontWeight.bold,
                      color:
                          _isShowSignUp ? signup_bg : signup_bg.withOpacity(.7),
                    ),
                    child: Transform.rotate(
                      angle: -_animationTextRotate.value * pi / 180,
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: () {
                          if (_isShowSignUp) {
                            updateView();
                          } else {
                            //Login
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: defpaultPadding * 0.7),
                          // color: Colors.red,
                          width: 160,
                          child: Text(
                            'Log In'.toUpperCase(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                AnimatedPositioned(
                  duration: defaultDuration,
                  top: !_isShowSignUp
                      ? _size.height / 1 - (_size.height / 2.5)
                      : _size.height * 0.07,
                  right: _isShowSignUp ? _size.width * 0.44 - 80 : 0,
                  child: AnimatedDefaultTextStyle(
                    duration: defaultDuration,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: !_isShowSignUp ? 20 : 32,
                      fontWeight: FontWeight.bold,
                      color: _isShowSignUp ? Colors.white70 : Colors.white,
                    ),
                    child: Transform.rotate(
                      angle: (90 - _animationTextRotate.value) * pi / 180,
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          if (_isShowSignUp) {
                            //Signup
                          } else {
                            updateView();
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: defpaultPadding * 0.7),
                          // color: Colors.red,
                          width: 160,
                          child: Text(
                            'Sign Up'.toUpperCase(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
