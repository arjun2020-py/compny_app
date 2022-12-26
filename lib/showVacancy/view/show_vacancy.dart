import 'package:company/Bottom_navigtion.dart/bottom_screen.dart';
import 'package:company/detailsShowVacancy/detailed_vacancy.dart';
import 'package:company/updateVacncy/view/update_vacancy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowVacncy extends StatelessWidget {
  const ShowVacncy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff439A97),
      appBar: AppBar(
        backgroundColor: const Color(0xff62B6B7),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => BottomScreen(),
              ),);
            },
            icon: const Icon(Icons.arrow_back_ios),),
        title: const Center(child: Text('Show Vacancy')),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded))
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailsShowVacancy(),
                ),);
              },
              child: Card(
                child: ListTile(
                  leading: Image.asset('assets/images/turq.jpeg'),
                  title: Text(
                    'Flutter Developer',
                    style: TextStyle(fontSize: 18.sp, color: Colors.blue),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Turquoic',
                        style: TextStyle(
                            fontSize: 15.r,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,),
                      ),
                      const Text('Trivandrum, Kerala, India '),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => UpdateVacancy(),
                              ),);
                            },
                            style: ElevatedButton.styleFrom(
                                primary: const Color(0xff439A97),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),),),
                            child: const Text('Update'),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                primary: const Color(0xffEB455F),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),),),
                            child: const Text('Delete'),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
