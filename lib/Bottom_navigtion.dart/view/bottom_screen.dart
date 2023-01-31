import 'package:company/DashboadScreen/view/dashboad_scren.dart';
import 'package:company/ProfileScreen/view/profile_screen.dart';
import 'package:company/addVacancy/view/add_vacancy.dart';
import 'package:company/jobApplication/view/job_application.dart';
import 'package:company/jobApplicationMain/view/job_application_man.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../showVacancy/view/show_vacancy.dart';

class BottomScreen extends StatefulWidget {
  BottomScreen({super.key});

  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  int _selectedIndex = 0;

  final List<Widget> _options = [
     DashboadScreen(),
    AddVacancy(),
    ShowVacncy(),
    JobApplicationMain(),
    ProfileScreen(),
  ];

  void onItemPressesd(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff439A97),
      // drawer: const DrawerScreen(),
      // appBar: AppBar(),
      body: _options[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        items: <Widget>[
          Icon(
            Icons.home,
            size: 20.sp,
          ),

          //label: 'Home',

          SvgPicture.asset(
            'assets/images/add-card-svgrepo-com.svg',
            height: 15.sp,
          ),
          //  label: 'Add Vacancy',

          Icon(
            Icons.work_outline,
            size: 20.sp,
          ),
          //  label: 'Show Jobs',

          Icon(
            Icons.grid_view,
            size: 20.sp,
          ),
          //label: 'Applications',

          SvgPicture.asset(
            'assets/images/user-profile-svgrepo-com.svg',
            width: 15.sp,
          ),
          //  label: 'Profile',
        ],
        // type: BottomNavigationBarType.fixed,
        // currentIndex: _selectedIndex,
        // selectedItemColor: Colors.black,
        // iconSize: 20.sp,
        animationDuration: Duration(microseconds: 500),
        height: 75,
        onTap: onItemPressesd,
        //backgroundColorcolor: Color(0xff1C315E),
        backgroundColor: const Color(0xff227C70),
        // color: Color.fromARGB(255, 5, 65, 8),
      ),
    );
  }
}
