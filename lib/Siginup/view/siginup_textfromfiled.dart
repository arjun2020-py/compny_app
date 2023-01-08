import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SiginupTextfromfiled extends StatelessWidget {
  SiginupTextfromfiled({
    Key? key,
    required this.emailController,
    required this.comapnyNameController,
    required this.companyAddress,
    required this.cityController,
    required this.contactNoController,
    required this.passwrodController,
    required this.confrompassController,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController comapnyNameController;
  final TextEditingController companyAddress;
  final TextEditingController cityController;
  final TextEditingController contactNoController;
  final TextEditingController passwrodController;
  final TextEditingController confrompassController;

  final fromkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: fromkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              autofocus: true,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'email id',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r))),
              validator: (value) {
                if (value!.isEmpty ||
                    !RegExp(r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$')
                        .hasMatch(value)) {
                  return 'enter valid email id';
                }
              },
            ),
            SizedBox(
              height: 10.h,
            ),
            TextFormField(
              controller: comapnyNameController,
              autofocus: true,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Comapny name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r))),
              validator: (value) {
                if (value!.isEmpty ||
                    !RegExp(r'^[a-zA-Z0-9]+([._]?[a-zA-Z0-9]+)*$')
                        .hasMatch(value)) {
                  return 'enter valid comapny name';
                }
              },
            ),
            SizedBox(
              height: 10.h,
            ),
            TextFormField(
              controller: companyAddress,
              autofocus: true,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'comapny Address',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r))),
              validator: (value) {
                if (value!.isEmpty ||
                    !RegExp(r'^[a-zA-Z0-9]+([._]?[a-zA-Z0-9]+)*$')
                        .hasMatch(value)) {
                  return 'enter valid comapny address';
                }
              },
            ),
            SizedBox(
              height: 10.h,
            ),
            TextFormField(
              controller: cityController,
              maxLength: null,
              keyboardType: TextInputType.multiline,
              autofocus: true,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'City',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r))),
              validator: (value) {
                if (value!.isEmpty ||
                    !RegExp(r'^[a-zA-Z0-9]+([._]?[a-zA-Z0-9]+)*$')
                        .hasMatch(value)) {
                  return 'enter valid city name';
                }
              },
            ),
            SizedBox(
              height: 10.h,
            ),
            TextFormField(
              controller: contactNoController,
              autofocus: true,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Conatct No',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r))),
              validator: (value) {
                if (value!.isEmpty ||
                    !RegExp(r'^(\+\d{1,3}[- ]?)?\d{10}$').hasMatch(value)) {
                  return 'enter valid mobile number';
                }
              },
            ),
            SizedBox(
              height: 10.h,
            ),
            TextFormField(
              controller: passwrodController,
              autofocus: true,
              obscureText: true,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'passwrod',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r))),
              validator: (value) {
                if (value!.length <= 6) {
                  return 'Should be atleast 6 charcaters';
                }
              },
            ),
            SizedBox(
              height: 10.h,
            ),
            TextFormField(
              controller: confrompassController,
              autofocus: true,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Confrom passwrod',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r))),
              validator: (value) {
                if (value != passwrodController.text) {
                  return 'passwrod is Wrong';
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
