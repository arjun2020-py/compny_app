import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:company/addVacancy/bloc/add_vacancy_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../showVacancy/view/show_vacancy.dart';

class AddVacancy extends StatelessWidget {
  AddVacancy({super.key});

//1
  final _jobVacancy = FirebaseFirestore.instance.collection('job_vacancy');
  final _auth = FirebaseAuth.instance;

//2
 // late final XFile? image;

  //3
  // Future<XFile?> getImage() async {
  //   print('=============================================================');

  //   final imagePicker = ImagePicker();
  //   image = await imagePicker.pickImage(source: ImageSource.gallery);
  //   print('------------------------------------------------------');
  // }

  //4

  TextEditingController jobtileController = TextEditingController(),
      companynameController = TextEditingController(),
      jobdecrptionController = TextEditingController(),
      jobLocationController = TextEditingController(),
      opeingController = TextEditingController(),
      startdateController = TextEditingController(),
      enddateController = TextEditingController(),
      minSalaryController = TextEditingController(),
      maxSalaryController = TextEditingController();

  final _jobAddBloc = AddVacancyBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _jobAddBloc,
      child: BlocListener<AddVacancyBloc, AddVacancyState>(
        listener: (context, state) {
          if (state is JobAddedSucess) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => ShowVacncy(),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Failed to  add vacancy')));
          }
        },
        child: Scaffold(
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
                  // Card(
                  //   child: Container(
                  //     width: 250.w,
                  //     height: 40.h,
                  //     child: Card(
                  //       color: Color(0xffFCFFE7),
                  //       shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(15.r)),
                  //       child: TextButton(
                  //         onPressed: getImage,
                  //         child: Text('Upload image'),
                  //       ),
                  //     ),
                  //   ),
                  // ),

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
                    controller: jobtileController,
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
                    controller: companynameController,
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
                    controller: jobdecrptionController,
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
                    controller: jobLocationController,
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
                      'Enter minmum  alary :',
                      style: TextStyle(fontSize: 17.sp),
                    ),
                  ),

                  SizedBox(
                    height: 10.h,
                  ),
                  TextFormField(
                    controller: minSalaryController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'enter  salary ',
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 200.r),
                    child: Text(
                      'Enter maximum  alary :',
                      style: TextStyle(fontSize: 17.sp),
                    ),
                  ),

                  SizedBox(
                    height: 10.h,
                  ),
                  TextFormField(
                    controller: maxSalaryController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'enter  salary ',
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
                    controller: opeingController,
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
                    controller: startdateController,
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
                    controller: enddateController,
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
                      onPressed: () => _jobAddBloc.add(
                        JobVacancyAdd(
                          jobTitle: jobtileController.text,
                          comapnyName: companynameController.text,
                          jobDerption: jobdecrptionController.text,
                          JobLocation: jobLocationController.text,
                          minSalary: minSalaryController.text,
                          maxSalary: maxSalaryController.text,
                          vacanyCount: opeingController.text,
                          startDate: startdateController.text,
                          endDate: enddateController.text,
                       //   image: image!,
                        ),
                      ),
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
        ),
      ),
    );
  }
}
