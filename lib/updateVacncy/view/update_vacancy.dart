import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:company/showVacancy/show_vacncy.dart';
import 'package:company/updateVacncy/bloc/update_vacancy_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../showVacancy/view/show_vacancy.dart';

class UpdateVacancy extends StatelessWidget {
  UpdateVacancy({
    super.key,
    required this.jobName,
    required this.companyName,
    required this.jobDec,
    required this.jobLoc,
    required this.jobOp,
    required this.startDate,
    required this.endDate,
    required this.minSal,
    required this.maxSal,
  });

  late final XFile image;

  late TextEditingController jobtileController =
          TextEditingController(text: jobName),
      companynameController = TextEditingController(text: companyName),
      jobdecrptionController = TextEditingController(text: jobDec),
      jobLocationController = TextEditingController(text: jobLoc),
      opeingController = TextEditingController(text: jobOp),
      startdateController = TextEditingController(text: startDate),
      enddateController = TextEditingController(text: endDate),
      minSalaryController = TextEditingController(text: minSal),
      maxSalaryController = TextEditingController(text: maxSal);

  String? jobName;
  String? companyName;
  String? jobDec;
  String? jobLoc;
  String? jobOp;
  String? startDate;
  String? endDate;
  String? minSal;
  String? maxSal;

  final updateBloc = UpdateVacancyBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => updateBloc,
      child: BlocListener<UpdateVacancyBloc, UpdateVacancyState>(
        listener: (context, state) {
          if (state is UpdateVacancySucess) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ShowVacncy(),
            ));
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Updation failed')));
          }
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xff205295),
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ShowVacncy(),
                  ),
                );
              },
              icon: const Icon(Icons.arrow_back),
            ),
            title: const Center(child: Text('Update Vacancy')),
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
                  // Card(
                  //   child: Container(
                  //     width: 250.w,
                  //     height: 40.h,
                  //     child: Card(
                  //       color: const Color(0xffFCFFE7),
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(15.r),
                  //       ),
                  //       child: TextButton(
                  //         onPressed: () {},
                  //         child: const Text('Upload image'),
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
                    height: 15.h,
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
                    height: 10.h,
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
                    padding: EdgeInsets.only(right: 220.r),
                    child: Text(
                      'enter min salary :',
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
                      hintText: 'enter salary',
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 220.r),
                    child: Text(
                      'enter max salary :',
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
                      hintText: 'enter salary',
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
                      onPressed: () => updateBloc.add(UpdateJobVcancy(
                        jobTile: jobtileController.text,
                        compName: companynameController.text,
                        jobDec: jobdecrptionController.text,
                        jobLoc: jobLocationController.text,
                        vacancyCount: opeingController.text,
                        minSal: minSalaryController.text,
                        maxSal: maxSalaryController.text,
                        startDate: startdateController.text,
                        endDate: enddateController.text,
                      )),
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xff2C74B3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                      ),
                      child: const Text('Update'),
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
