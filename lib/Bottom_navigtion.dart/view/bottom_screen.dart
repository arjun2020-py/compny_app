import 'package:company/DashboadScreen/view/dashboad_scren.dart';
import 'package:company/addVacancy/view/add_vacancy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

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
    const Center(child: Text('Job Application')),
    const Center(child: Text('Profile'))
  ];

  void onItemPressesd(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff439A97),
      // drawer: const DrawerScreen(),
      // appBar: AppBar(),
      body: _options[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/add-card-svgrepo-com.svg'),
            label: 'Add Vacancy',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/file-info-paper-person-profile-svgrepo-com.svg',
            ),
            label: 'Job Application',
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/user-profile-svgrepo-com.svg',
              ),
              label: 'Profile')
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        iconSize: 22.sp,
        onTap: onItemPressesd,
        backgroundColor: Color(0xffFAF8F1),
      ),
    );
  }
}
