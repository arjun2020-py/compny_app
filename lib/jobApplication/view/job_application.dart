import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:company/jobApplication/bloc/job_application_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rxdart/rxdart.dart';

class JobApplication extends StatefulWidget {
  const JobApplication({super.key});

  @override
  State<JobApplication> createState() => _JobApplicationState();
}

List<String> status = <String>[
  'Application submited',
  'Application viewed',
  'Employer reached out',
  'Not selected by employer',
  'Interviewing',
  'Hired'
];
String selectedValues = status.first;

class _JobApplicationState extends State<JobApplication> {
  // Stream<QuerySnapshot> searchResult() {
  //   final falseRoomStream = FirebaseFirestore.instance
  //       .collection('job_vacancy')
  //       .where('id', isEqualTo: 'false')
  //       .snapshots();

  //   final pendingRoomStream = FirebaseFirestore.instance
  //       .collection('room-list')
  //       .where('id', isEqualTo: 'pending')
  //       .snapshots();

  //   return MergeStream([falseRoomStream, pendingRoomStream]);
  // }

  final _jobAppBloc = JobApplicationBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _jobAppBloc
        ..add(
          JobApplicationCollection(
            status: selectedValues,
          ),
        ),
      child: BlocBuilder<JobApplicationBloc, JobApplicationState>(
        builder: (context, state) {
          if (state is JobApplictionSucesses) {}
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back_ios_new),
              ),
              title: const Text('Job Application'),
            ),
            body: SingleChildScrollView(
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r)),
                color: Color(0xffFEC868),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: const Text('Job Title:'),
                      title: Padding(
                        padding: EdgeInsets.only(bottom: 10.r),
                        child: const Text('Flutter Developer'),
                      ),
                    ),
                    ListTile(
                      leading: const Text('Monthly in-hand Salary:'),
                      title: Padding(
                        padding: EdgeInsets.only(bottom: 10.r),
                        child: const Text('10k-25k'),
                      ),
                    ),
                    ListTile(
                      leading: const Text('Job Decrption:'),
                      title: Padding(
                        padding: EdgeInsets.only(bottom: 0.r),
                        child: const Text(
                          'Responsible for creating and maintaining mobile applications using the Flutter framework. This involves designing and implementing new features, debugging and fixing issues, and optimizing the performance of the app.',
                        ),
                      ),
                    ),
                    ListTile(
                      leading: const Text('Job Location:'),
                      title: Padding(
                        padding: EdgeInsets.only(bottom: 10.r),
                        child: const Text('Calicut, Kerala'),
                      ),
                    ),
                    ListTile(
                      leading: const Text('No of Opening:'),
                      title: Padding(
                        padding: EdgeInsets.only(bottom: 10.r),
                        child: const Text('2'),
                      ),
                    ),
                    ListTile(
                      leading: const Text('Apply Date:'),
                      title: Padding(
                        padding: EdgeInsets.only(bottom: 10.r),
                        child: const Text('20/01/23'),
                      ),
                    ),
                    ListTile(
                      leading: const Text('Last Date:'),
                      title: Padding(
                        padding: EdgeInsets.only(bottom: 10.r),
                        child: const Text('30/01/23'),
                      ),
                    ),
                    ListTile(
                      leading: const Text('First Name:'),
                      title: Padding(
                        padding: EdgeInsets.only(bottom: 10.r),
                        child: const Text('John'),
                      ),
                    ),
                    ListTile(
                      leading: const Text('Last Name:'),
                      title: Padding(
                        padding: EdgeInsets.only(bottom: 10.r),
                        child: const Text('luther'),
                      ),
                    ),
                    ListTile(
                      leading: const Text('Email:'),
                      title: Padding(
                        padding: EdgeInsets.only(bottom: 10.r),
                        child: const Text('jhon@gmail.com'),
                      ),
                    ),
                    ListTile(
                      leading: const Text(' Mob No:'),
                      title: Padding(
                        padding: EdgeInsets.only(bottom: 10.r),
                        child: const Text('9539925440'),
                      ),
                    ),
                    ListTile(
                      leading: const Text('Country:'),
                      title: Padding(
                        padding: EdgeInsets.only(bottom: 10.r),
                        child: const Text('India'),
                      ),
                    ),
                    ListTile(
                      leading: const Text('City:'),
                      title: Padding(
                        padding: EdgeInsets.only(bottom: 10.r),
                        child: const Text('kozhikode'),
                      ),
                    ),
                    ListTile(
                      leading: Padding(
                        padding: EdgeInsets.only(top: 5.r),
                        child: const Text('Education Level:'),
                      ),
                      title: Padding(
                        padding: EdgeInsets.only(bottom: 10.r),
                        child: TextButton(
                          onPressed: () {},
                          child: const Text('Candidate Education level'),
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Padding(
                        padding: EdgeInsets.only(top: 5.r),
                        child: const Text(' Skills:'),
                      ),
                      title: Padding(
                        padding: EdgeInsets.only(bottom: 10.r),
                        child: TextButton(
                          onPressed: () {},
                          child: const Text('Candidate Skills '),
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Padding(
                        padding: EdgeInsets.only(top: 5.r),
                        child: const Text('Certficates:'),
                      ),
                      title: Padding(
                        padding: EdgeInsets.only(bottom: 10.r),
                        child: TextButton(
                          onPressed: () {},
                          child: const Text('Candidate Certfictes '),
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Padding(
                        padding: EdgeInsets.only(top: 5.r),
                        child: const Text('Resume:'),
                      ),
                      title: Padding(
                        padding: EdgeInsets.only(bottom: 10.r),
                        child: TextButton(
                          onPressed: () {},
                          child: const Text('Download '),
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Padding(
                        padding: EdgeInsets.only(top: 5.r),
                        child: const Text('Status:'),
                      ),
                      title: DropdownButton<String>(
                          elevation: 3,
                          value: selectedValues,
                          isExpanded: true,
                          icon: Icon(
                            Icons.arrow_drop_down_sharp,
                            size: 30.sp,
                          ),
                          items: status
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              selectedValues = value!;
                            });
                          }),
                    ),
                    ElevatedButton(onPressed: () {}, child: Text('Verfied'))
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
