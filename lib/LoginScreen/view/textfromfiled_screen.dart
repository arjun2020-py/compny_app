import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextfromfiledScreen extends StatelessWidget {
   TextfromfiledScreen({
    Key? key, required this.emailController,required this.passwrodConroller
  }) : super(key: key);

  TextEditingController emailController = TextEditingController(),
      passwrodConroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: emailController,
          autofocus: true,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'email id',
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 14, 234, 91),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 2.0,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        TextFormField(
          controller: passwrodConroller,
          autofocus: true,
          obscureText: true,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'passwrod',
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 14, 234, 91),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(
                color: Colors.red,
                width: 2.0.w,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
