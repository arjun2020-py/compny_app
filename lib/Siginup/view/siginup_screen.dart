import 'package:company/LoginScreen/view/login_scrren.dart';
import 'package:company/Siginup/bloc/siginup_auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:motion_toast/motion_toast.dart';

import 'siginup_textfromfiled.dart';

class SiginupScreen extends StatelessWidget {
  SiginupScreen({super.key});

  TextEditingController emailController = TextEditingController(),
      comapnyNameController = TextEditingController(),
      companyAddress = TextEditingController(),
      cityController = TextEditingController(),
      contactNoController = TextEditingController(),
      passwrodController = TextEditingController(),
      confrompassController = TextEditingController();

  final siginupBloc = SiginupAuthBloc();

  final fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => siginupBloc,
      child: BlocListener<SiginupAuthBloc, SiginupAuthState>(
        listener: (context, state) {
          if (state is SiginupSucess) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Siginup success')));

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Siginup failed')));
          }
        },
        child: Scaffold(
          backgroundColor: const Color(0xffE1D7C6),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(200.r),
            child: AppBar(
              automaticallyImplyLeading: false,
              title: Padding(
                padding: EdgeInsets.only(top: 20.r),
                child: Center(
                  child: Text(
                    'Siginup',
                    style: TextStyle(fontSize: 30.sp),
                  ),
                ),
              ),
              backgroundColor: const Color(0xff579BB1),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(140.r)),
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.only(top: 20.r, bottom: 10.r),
            child: SingleChildScrollView(
              child: Form(
                key: fromKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    //SiginupTextfromfiled(),
                    SiginupTextfromfiled(
                      emailController: emailController,
                      comapnyNameController: comapnyNameController,
                      companyAddress: companyAddress,
                      cityController: cityController,
                      contactNoController: contactNoController,
                      passwrodController: passwrodController,
                      confrompassController: confrompassController,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      width: 200.w,
                      child: ElevatedButton(
                        onPressed: () => siginupBloc.add(
                          SiginupEvent(
                            emailid: emailController.text,
                            companyName: comapnyNameController.text,
                            companyAddress: companyAddress.text,
                            city: cityController.text,
                            contactNo: contactNoController.text,
                            pass: passwrodController.text,
                            confromPass: confrompassController.text,
                          ),
                        ),
                        // onPressed: () {
                        //   Navigator.pop(context);
                        // },
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xff86C8BC),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                        child: const Text('Siginup'),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Already have an login',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 14.sp),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ));
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 14.sp),
                            ))
                      ],
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
                            margin:
                                const EdgeInsets.only(left: 20.0, right: 10.0),
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
                    Column(
                      children: [
                        const Text(
                          'Login in with',
                          style: TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                FontAwesomeIcons.facebook,
                                color: Colors.blue,
                                size: 22.r,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                FontAwesomeIcons.google,
                                color: Colors.redAccent,
                                size: 22.r,
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                FontAwesomeIcons.github,
                                size: 22.r,
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
