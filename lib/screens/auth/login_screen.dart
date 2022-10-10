import 'package:clean_api/clean_api.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:nahid_24/screens/auth/signup_screen.dart';
import 'package:nahid_24/screens/home/home_page.dart';
import 'package:nahid_24/utils/constants/assets.dart';
import 'package:nahid_24/utils/constants/colors.dart';
import 'package:nahid_24/utils/constants/themes.dart';
import 'package:nahid_24/utils/widget/custom_button.dart';
import 'package:nahid_24/utils/widget/custom_textfield.dart';
import 'package:nahid_24/utils/widget/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../Http/Login/login.dart';
import '../../application/auth/auth_provider.dart';
import '../../application/auth/auth_state.dart';
import '../../domain/app/user_profile.dart';
import '../../domain/auth/login_body.dart';
import '../../utils/function/navigation.dart';
import '../../utils/widget/custom_text_button.dart';
import 'Forget/forgor_password.dart';

// class LogInScreen extends StatefulWidget {
//   const LogInScreen({Key? key}) : super(key: key);

//   @override
//   State<LogInScreen> createState() => _LogInScreenState();
// }

//   @override
//   Widget build(BuildContext context, ref) {

//     // final numberController = useTextEditingController();
//     // final passwordController = useTextEditingController(text: '123456');
//     // final state = ref.watch(authProvider);

//     // ref.listen<AuthState>(authProvider, (previous, next) {
//     //   if (previous != next || !next.loading) {
//     //     if (next.failure != CleanFailure.none() ||
//     //         next.userProfile == UserProfile.empty()) {
//     //       if (next.failure != CleanFailure.none()) {
//     //         // CleanFailureDialogue.show(context, failure: next.failure);
//     //       }

//     //       // Navigator.of(context).pushReplacement(
//     //       //     MaterialPageRoute(builder: (context) => LogInScreen()));
//     //     } else {
//     //       Navigator.of(context).pushReplacement(
//     //           MaterialPageRoute(builder: (context) => NavigationScreen(selectedIndex: 0,)));
//     //     }
//     //   }
//     // });

//     // useEffect(() {
//     //   Future.delayed(Duration(milliseconds: 100), () {
//     //     ref.read(authProvider.notifier).login(LoginBody(
//     //         number: numberController.text, password: passwordController.text));
//     //   });
//     //   return null;
//     // }, []);

//   }

// }

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController number = TextEditingController();
  TextEditingController password = TextEditingController();

  bool loading = false;
  bool remember = false;

  Future login() async {
    setState(() {
      loading = true;
    });
    HttpLogin()
        .login(context: context, number: number.text, password: password.text);
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFfe4e6eb),
        body: Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(color: PColor.containerColor),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 3,
                  child: Stack(
                    children: [
                      Positioned(
                        right: 10,
                        top: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "How to use this app",
                              style: TextStyle(color: Colors.white),
                            ),
                            IconButton(
                              onPressed: () {
                                // Navigator.push(context, MaterialPageRoute(builder: (context)=> const ));
                              },
                              icon: Container(
                                child: Image.asset(
                                  PAssets.play_button,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 10.0),
                        child: CircleAvatar(
                          radius: 75,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage(PAssets.logo),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      CustomTextField(
                          controller: number,
                          title: "Mobile Number or Email",
                          image: PAssets.email,
                          obscureText: false),
                      SizedBox(
                        height: 15,
                      ),
                      CustomTextField(
                          controller: password,
                          title: "Password",
                          image: PAssets.lock,
                          obscureText: true),
                      Row(
                        children: [
                          Checkbox(
                              onChanged: ((value) {
                                setState(() {
                                  remember = value!;
                                });
                              }),
                              value: remember),
                          Text("Remember me"),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => ForgetScreen())));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                "forgot password",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.indigo),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      loading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : SumitButton(
                              radius: PThemes.buttonShape,
                              width: 100,
                              height: 30,
                              onTap: () {
                                login();
                              },
                              title: "Sign in",
                              color: PColor.submitButtonColorBlue),
                      SizedBox(height: 10.h),
                      Text(
                        "or Login with",
                        style: TextStyle(fontSize: 20.sp),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 120.w,
                            child: SignInButton(
                              Buttons.Facebook,
                              text: "Facebook",
                              onPressed: () {},
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Container(
                            width: 120.w,
                            child: SignInButton(
                              Buttons.Google,
                              text: "Google",
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(fontSize: 16),
                          ),
                          CustomButton(
                            border: Border.all(
                              width: 0.8,
                              color: PColor.submitButtonColorBlue,
                            ),
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => SignUpScreen()));
                            },
                            title: "Sign Up",
                            color: PColor.submitButtonColorBlue,
                          )
                        ],
                      )
                    ],
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
