import 'package:company/showVacancy/view/show_vacancy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsShowVacancy extends StatelessWidget {
  DetailsShowVacancy({super.key, required this.detailsJob});

  var detailsJob;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff68B984),
      appBar: AppBar(
        backgroundColor: const Color(0xff3D5656),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => ShowVacncy(),
              ),
            );
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            width: 350.w,
            height: 350.h,
            child: Card(
              color: const Color(0xffCFFDE1),
              child: ListTile(
                // ignore: avoid_dynamic_calls
                leading: (detailsJob['comapnyImage'] == '')
                    ? Image.asset(
                        'assets/images/comapnyDefult.png',
                        width: double.infinity,
                        height: 150.h,
                        fit: BoxFit.cover,
                      )
                    : Image.network(detailsJob['comapnyImage'].toString()),
                title: Padding(
                  padding: EdgeInsets.only(left: 10.r, top: 20.r),
                  child: Text(detailsJob['jobTile'].toString()),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(detailsJob['comapnyName'].toString()),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(detailsJob['jobLocation'].toString()),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      width: 200.w,
                      height: 30.h,
                      child: Card(
                        child: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(detailsJob['minSalary'].toString()),
                            const Text('-'),
                            Text(detailsJob['maxSalary'].toString())
                          ],
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      detailsJob['jobDecrption'].toString(),
                      maxLines: null,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(detailsJob['vacancyCount'].toString()),
                    SizedBox(
                      height: 30.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 30.r),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(detailsJob['startDate'].toString()),
                          SizedBox(
                            width: 40.sp,
                          ),
                          Text(detailsJob['endDate'].toString())
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
