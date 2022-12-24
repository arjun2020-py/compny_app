import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboadScreen extends StatelessWidget {
  const DashboadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1C315E),
        // leading: IconButton(
        //     onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
        title: const Center(
          child: Text(
            'Dashboad',
            style: TextStyle(fontSize: 20),
          ),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      backgroundColor: const Color(0xff227C70),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300.w,
              height: 100.h,
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Total Vacancy Posted:',
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
                      'Total No Of Applicationu:',
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
    );
  }
}
