import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:company/DashboadScreen/dashboad_screen.dart';
import 'package:company/jobApplication/view/job_application.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Bottom_navigtion.dart/view/bottom_screen.dart';

class JobApplicationMain extends StatelessWidget {
  JobApplicationMain({super.key});

  final _auth = FirebaseAuth.instance;
  CollectionReference jobVacanyies =
      FirebaseFirestore.instance.collection('job_vacancy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BottomScreen(),
              ),
            );
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Job Application'),
      ),
      body: StreamBuilder(
        stream: jobVacanyies
            .where('userid', isEqualTo: _auth.currentUser!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          // var jobData = snapshot.hasData;
          if (snapshot.hasData) {
            final jobDatas = snapshot.data!.docs;
            return ListView.builder(
              itemCount: jobDatas.length,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 80.h,
                  child: SingleChildScrollView(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                JobApplication(jobData: jobDatas[index]),
                          ),
                        );
                      },
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.only(right: 200.r),
                          child: Column(
                            children: [
                              Text(jobDatas[index]['jobTile'].toString()),
                              Text(jobDatas[index]['comapnyName'].toString()),
                              Text(jobDatas[index]['jobLocation'].toString()),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
