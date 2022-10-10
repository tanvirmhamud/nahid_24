import 'package:nahid_24/Http/Login/login.dart';
import 'package:nahid_24/utils/constants/assets.dart';
import 'package:nahid_24/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class NewPasswordScreen extends StatefulWidget {
  final String email;
  const NewPasswordScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
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
        email: widget.email, password: confirmpassword.text, context: context);
    setState(() {
      btnloading = false;
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
                          "Submit",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
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
}
