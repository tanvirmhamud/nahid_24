import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nahid_24/screens/auth/login_screen.dart';
import 'package:nahid_24/utils/constants/assets.dart';
import 'package:nahid_24/utils/constants/themes.dart';
import 'package:nahid_24/utils/widget/custom_text_button.dart';
import 'package:nahid_24/utils/widget/submit_button.dart';
import 'package:flutter/material.dart';
import '../../Helper/toast.dart';
import '../../Http/Login/login.dart';
import '../../utils/constants/colors.dart';
import '../../utils/widget/custom_textfield.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final usernameController = TextEditingController();
  final numberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool loading = false;

  Future registation() async {
    if (usernameController.text.isEmpty) {
      error("Enter your name");
    } else if (emailController.text.isEmpty) {
      error("Enter your email");
    } else if (numberController.text.isEmpty) {
      error("Enter your number");
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text)) {
      error("Invalid email");
    } else if (numberController.text.length < 11) {
      error("Enter 11 digit number");
    } else if (passwordController.text.isEmpty) {
      error("Enter password");
    } else if (passwordController.text.length < 6) {
      error("Enter minimum 6 character password");
    } else {
      setState(() {
        loading = true;
      });
      await HttpLogin().registation(
          context: context,
          email: emailController.text,
          name: usernameController.text,
          number: numberController.text,
          password: passwordController.text);
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xFfe4e6eb),
          body: SingleChildScrollView(
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
                      CustomTextField(
                        controller: usernameController,
                        obscureText: false,
                        title: "Your name",
                        image: PAssets.person,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomTextField(
                          controller: emailController,
                          obscureText: false,
                          title: "Email",
                          image: PAssets.email),
                      SizedBox(
                        height: 15,
                      ),
                      CustomTextField(
                        controller: numberController,
                        obscureText: false,
                        title: "Mobile number",
                        image: PAssets.phone,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomTextField(
                          controller: passwordController,
                          obscureText: true,
                          title: "Password",
                          image: PAssets.lock),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              "Password must be at least 8 characters",
                              style: TextStyle(
                                  fontSize: 14.sp, color: Colors.indigo),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
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
                                registation();
                                // ref.read(authProvider.notifier).singUp(
                                //     SignUpBody(
                                //         name: usernameController.text,
                                //         email: emailController.text,
                                //         password: passwordController.text,
                                //         number: numberController.text));
                              },
                              title: "Sign up",
                              color: PColor.submitButtonColorBlue),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already  have an account? ",
                            style: TextStyle(fontSize: 16),
                          ),
                          CustomTextButton(
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => LogInScreen()));
                              },
                              title: "Log In",
                              color: PColor.submitButtonColorBlue)
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

// class SignUpScreen extends HookConsumerWidget {
//   const SignUpScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, ref) {
  
//     // final state = ref.watch(authProvider);

//     // ref.listen<AuthState>(authProvider, (previous, next) {
//     //   if (previous != next || !next.loading) {
//     //     if (next.failure != CleanFailure.none() ||
//     //         next.userProfile == UserProfile.empty()) {
//     //       if (next.failure != CleanFailure.none()) {
//     //         CleanFailureDialogue.show(context, failure: next.failure);
//     //       }

//     //       // Navigator.of(context).pushReplacement(
//     //       //     MaterialPageRoute(builder: (context) => LogInScreen()));
//     //     }
//     //     if (next.failure == CleanFailure.none()) {
//     //       Navigator.of(context).pushReplacement(
//     //           MaterialPageRoute(builder: (context) => LogInScreen()));
//     //     }
//     //   }
//     // });


    

    
//   }
// }
