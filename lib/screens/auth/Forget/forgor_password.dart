import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nahid_24/Http/Login/login.dart';
import 'package:nahid_24/utils/constants/assets.dart';
import 'package:nahid_24/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import 'newpassword.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({Key? key}) : super(key: key);

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController otp = TextEditingController();
  TextEditingController otpverify = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  final key = GlobalKey<FormState>();

  bool loading = false;

  bool btnloading = false;

  Future newpassword() async {
    setState(() {
      btnloading = true;
    });
    await HttpLogin().newpassword(
        email: email.text, password: confirmpassword.text, context: context);
    setState(() {
      btnloading = false;
    });
  }

  final key2 = GlobalKey<FormState>();

  bool otploading = false;

  bool showpasswordbox = false;

  Future otpsend() async {
    var otpvalue = await HttpLogin().otpsend(email: email.text);
    otp.text = otpvalue['OTP'].toString();

    setState(() {
      otploading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: key,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(color: PColor.containerColor),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 3,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {
                                // Navigator.push(context, MaterialPageRoute(builder: (context)=> const ));
                              },
                              icon: Container(
                                child: Image.asset(
                                  PAssets.play_button,
                                ),
                              )),
                        ],
                      ),
                      CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage(PAssets.logo)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: textfbox(
                    controller: email,
                    image: PAssets.email,
                    lavel: "Email",
                  ),
                ),
                InkWell(
                    onTap: () {
                      otpsend();
                    },
                    child: Container(
                      padding: EdgeInsets.all(10.r),
                      child: Text(
                        "Send Code",
                        style: TextStyle(color: Colors.white),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.indigo,
                          borderRadius: BorderRadius.circular(5.r)),
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: textfbox(
                    validator: (value) {
                      print(value);
                      if (value != otp.text || value!.isEmpty) {
                        return "Code not match. try again";
                      } else {}
                    },
                    controller: otpverify,
                    image: PAssets.lock,
                    lavel: "Code",
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (key.currentState!.validate()) {
                      setState(() {
                        showpasswordbox = true;
                      });
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: ((context) => NewPasswordScreen(
                      //               email: email.text,
                      //             ))));

                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(10.r),
                    decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(5.r)),
                    child: Text(
                      "Verify",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                showpasswordbox ? newpasswordbox() : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textfbox({
    TextEditingController? controller,
    String? lavel,
    image,
    Widget? child,
    FormFieldValidator<String>? validator,
  }) {
    return Card(
      elevation: 20,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        decoration: BoxDecoration(
            color: PColor.textfieldColor,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Flexible(
              child: TextFormField(
                validator: validator,
                controller: controller,
                decoration: InputDecoration(
                    labelText: lavel,
                    prefixIcon: Container(
                      height: 50,
                      width: 50,
                      child: Image.asset(
                        image,
                        scale: 14,
                      ),
                    ),
                    border: InputBorder.none),
              ),
            ),
            child ?? Container()
          ],
        ),
      ),
    );
  }

  Widget newpasswordbox() {
    return Form(
      key: key2,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: textfbox(
              controller: password,
              image: PAssets.message,
              lavel: "New Password",
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: textfbox(
              controller: confirmpassword,
              image: PAssets.lock,
              lavel: "Confirm Password",
              validator: (value) {
                if (value != password.text) {
                  return "Password not match";
                } else if (value!.length < 8) {
                  return "Minimum 8 characters";
                } else {}
              },
            ),
          ),
          btnloading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : MaterialButton(
                  color: Colors.indigo,
                  onPressed: () {
                    if (key.currentState!.validate()) {
                      newpassword();
                    }
                  },
                  child: Text(
                    "Finish",
                    style: TextStyle(color: Colors.white),
                  ),
                )
        ],
      ),
    );
  }
}
