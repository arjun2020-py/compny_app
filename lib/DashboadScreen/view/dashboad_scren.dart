import 'package:company/DashboadScreen/bloc/dash_boad_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboadScreen extends StatelessWidget {
  DashboadScreen({super.key});

  final dashBoadBloc = DashBoadBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => dashBoadBloc..add(DsahBoadScreenEvent()),
      child: BlocBuilder<DashBoadBloc, DashBoadState>(
        builder: (context, state) {
          if (state is DashBoadSucessState) {
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: const Color(0xff1C315E),
                title: const Center(
                  child: Text(
                    'Dashboad',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  ),
                ],
              ),
              backgroundColor: const Color(0xff227C70),
              body: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // SizedBox(
                        //   width: 300.w,
                        //   height: 100.h,
                        //   child: Card(
                        //     child: Column(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //         Text(
                        //           'Total Vacancy Posted:',
                        //           style: TextStyle(fontSize: 15.sp),
                        //         ),
                        //         Text(
                        //           '4',
                        //           style: TextStyle(fontSize: 15.sp),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          width: 300.w,
                          height: 100.h,
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Total No Of Application:',
                                  style: TextStyle(fontSize: 15.sp),
                                ),
                                Text(
                                  state.totalJobs.toString(),
                                  style: TextStyle(fontSize: 15.sp),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          width: 300.w,
                          height: 100.h,
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Total No Of New Application:',
                                  style: TextStyle(fontSize: 15.sp),
                                ),
                                Text(
                                  '4',
                                  style: TextStyle(fontSize: 15.sp),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          width: 300.w,
                          height: 100.h,
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Total No of Selected Application:',
                                  style: TextStyle(fontSize: 15.sp),
                                ),
                                Text(
                                  '4',
                                  style: TextStyle(fontSize: 15.sp),
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
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
