import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JobApplication extends StatefulWidget {
  const JobApplication({super.key});

  @override
  State<JobApplication> createState() => _JobApplicationState();
}

class _JobApplicationState extends State<JobApplication> {
   List<Widget> _cardList = [];

  void _addCardWidget() {
    setState(() {
      _cardList.add(_card());
    });
  }

  Widget _card() {
    return Container();
  }
  List<String> jobType = <String>[
    'Sorted'
        'Selected',
    ' Not Selected',
  ];
  String selectedValue = 'Sorted';

  @override
  Widget build(BuildContext context) {
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
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
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton<String>(
                    value: selectedValue,
                    isExpanded: true,
                    icon: const Icon(
                      Icons.arrow_drop_down_sharp,
                      size: 30,
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        selectedValue = value!;
                      });
                    },
                    items:
                        jobType.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
