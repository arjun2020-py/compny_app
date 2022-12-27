import 'package:company/Bottom_navigtion.dart/bottom_screen.dart';
import 'package:company/LoginScreen/view/textfromfiled_screen.dart';
import 'package:company/Siginup/siginup_screen.dart';
import 'package:company/forgotPaswwrod/view/forgot_passwrod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEAE7B1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200.r),
        child: AppBar(
          title: Padding(
            padding: EdgeInsets.only(top: 20.r),
            child: Center(
              child: Text(
                'Login',
                style: TextStyle(fontSize: 30.sp),
              ),
            ),
          ),
          backgroundColor: const Color(0xff3C6255),
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.only(bottomRight: Radius.circular(140.r)),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20.r, bottom: 10.r),
        child: SingleChildScrollView(
          child: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                const TextfromfiledScreen(),
                const SizedBox(
                  width: 20,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ForgotPass(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 180.r),
                    child: Text(
                      'Forogt passwrod ?',
                      style: TextStyle(fontSize: 15.sp),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  width: 200.w,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => BottomScreen(),
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xff86C8BC),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    child: const Text('Login'),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 10, right: 20),
                        child: const Divider(
                          color: Colors.black45,
                          thickness: 0.8,
                        ),
                      ),
                    ),
                    const Text('OR'),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                        child: const Divider(
                          color: Colors.black45,
                          thickness: 0.8,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  width: 200.w,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SiginupScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xffFFD4B2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    child: const Text('Siginup'),
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
