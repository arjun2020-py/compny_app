import 'package:company/showVacancy/view/show_vacancy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsShowVacancy extends StatelessWidget {
  const DetailsShowVacancy({super.key});

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
                builder: (context) => const ShowVacncy(),
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
                leading: Image.asset('assets/images/turq.jpeg'),
                title: Padding(
                  padding: EdgeInsets.only(left: 10.r, top: 20.r),
                  child: const Text('job title'),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    const Text('company name'),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Text('location'),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      width: 200.w,
                      height: 30.h,
                      child: const Card(
                        child: Center(child: Text('salary')),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Text(
                      'job decrption',
                      maxLines: null,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Text('no of opeing'),
                    SizedBox(
                      height: 30.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 30.r),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text('appaly date'),
                          SizedBox(
                            width: 40.sp,
                          ),
                          const Text('last date')
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
