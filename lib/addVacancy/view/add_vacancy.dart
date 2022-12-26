import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../showVacancy/view/show_vacancy.dart';

class AddVacancy extends StatelessWidget {
  const AddVacancy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0A2647),
        title: const Center(child: Text('Add Vacancy')),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10.h,
              ),
              // Padding(
              //   padding: EdgeInsets.only(right: 150.r),
              //   child: Text(
              //     'Job Infromation',
              //     style: TextStyle(
              //       fontSize: 20.sp,
              //     ),
              //   ),
              // ),
              Card(
                child: Container(
                  width: 250.w,
                  height: 40.h,
                  child: Card(
                    color: Color(0xffFCFFE7),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.r)),
                    child: TextButton(
                      onPressed: () {},
                      child: Text('Upload image'),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 250.r),
                child: Text(
                  'job title :',
                  style: TextStyle(fontSize: 17.sp),
                ),
              ),

              SizedBox(
                height: 10.h,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'enter job title',
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 200.r),
                child: Text(
                  'comapny name :',
                  style: TextStyle(fontSize: 17.sp),
                ),
              ),

              SizedBox(
                height: 10.h,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'enter comapny name',
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 200.r),
                child: Text(
                  ' job description :',
                  style: TextStyle(fontSize: 17.sp),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              TextFormField(
                maxLines: null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'enter  job description',
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 220.r),
                child: Text(
                  'job location :',
                  style: TextStyle(fontSize: 17.sp),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'enter job location',
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 200.r),
                child: Text(
                  'no of opening :',
                  style: TextStyle(fontSize: 17.sp),
                ),
              ),

              SizedBox(
                height: 10.h,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'enter no of opening',
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 240.r),
                child: Text(
                  'start date :',
                  style: TextStyle(fontSize: 17.sp),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'enter start date',
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 240.r),
                child: Text(
                  'end date :',
                  style: TextStyle(fontSize: 17.sp),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'enter end date',
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                width: 200.w,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const ShowVacncy(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff144272),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                  ),
                  child: const Text('Add'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
