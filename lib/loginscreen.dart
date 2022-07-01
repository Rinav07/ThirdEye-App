import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:thirdeye/constant.dart';
import 'package:thirdeye/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: pblack,
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        'assets/image 15 (Traced).png',
                        width: 100,
                        height: 100,
                      ),
                      Flexible(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height*0.03,
                        ),
                      ),
                      const Text(
                        'Welcome Back',
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Flexible(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height*0.01,
                        ),
                      ),
                      const Text(
                        'Sign in to Continue',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF9B9797),
                          fontWeight: FontWeight.normal,
                        ),
                      ),

                    ],
                  ),
                ),

                Flexible(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 62,
                          decoration: BoxDecoration(
                            color: const Color(0xFF262931),
                            borderRadius: BorderRadius.circular(7.0),
                            border: Border.all(color: const Color(0x143A4853)),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: TextField(
                                keyboardType: TextInputType.emailAddress,
                                cursorColor: pyellow,
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(

                                  hintText: 'POLICE PERSONAL ID',
                                  hintStyle: const TextStyle(color: Color(0xFF666565)),
                                  border: InputBorder.none,
                                  prefixIcon: Container(
                                    padding: const EdgeInsets.all(12),
                                    child: SvgPicture.asset(
                                      'assets/email.svg',
                                    ),
                                  ),
                                  // Icon(
                                  //   Icons.mail_outline_rounded,
                                  //   color: Color(0x9f292D32),
                                  // ),
                                  //prefixIconColor: Color(0xff292D32),
                                ),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: pyellow,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 62,
                          decoration: BoxDecoration(
                            color: const Color(0xFF262931),
                            borderRadius: BorderRadius.circular(7.0),
                            border: Border.all(color: const Color(0x143A4853)),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: TextField(
                                obscureText: true,
                                obscuringCharacter: '*',
                                keyboardType: TextInputType.emailAddress,
                                cursorColor: pyellow,
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  hintText: 'PASSWORD',
                                  hintStyle: const TextStyle(color: Color(0xFF666565)),
                                  border: InputBorder.none,
                                  prefixIcon: Container(
                                    padding: const EdgeInsets.all(12),
                                    child: SvgPicture.asset(
                                      'assets/lock.svg',
                                    ),
                                  ),
                                  // Icon(
                                  //   Icons.mail_outline_rounded,
                                  //   color: Color(0x9f292D32),
                                  // ),
                                  //prefixIconColor: Color(0xff292D32),
                                ),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: pyellow,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: (){},
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: pyellow,
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: HomePage(),
                                    type: PageTransitionType.rightToLeft));
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(pyellow),
                          ),
                          child: const SizedBox(
                            height: 62,
                            width: double.infinity,
                            child: Center(
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                              text: "Don't have an account? ",
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontSize: 16,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Sign Up',
                                  style: TextStyle(
                                    color: pyellow,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
