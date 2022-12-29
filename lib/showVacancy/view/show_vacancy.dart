import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:company/Bottom_navigtion.dart/bottom_screen.dart';
import 'package:company/detailsShowVacancy/detailed_vacancy.dart';
import 'package:company/updateVacncy/view/update_vacancy.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowVacncy extends StatelessWidget {
  ShowVacncy({super.key});

  CollectionReference vacancyRef =
      FirebaseFirestore.instance.collection('job_vacancy');

  final FirebaseAuth _auth = FirebaseAuth.instance;

  var vacancyItems;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff439A97),
      appBar: AppBar(
        backgroundColor: const Color(0xff62B6B7),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => BottomScreen(),
              ),
            );
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Center(child: Text('Show Vacancy')),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded))
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: vacancyRef
              .where('userid', isEqualTo: _auth.currentUser!.uid)
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              final vacancyItems = snapshot.data!.docs;

              return ListView.builder(
                itemCount: vacancyItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailsShowVacancy(),
                          ),
                        );
                      },
                      child: Card(
                        child: ListTile(
                          leading: (vacancyItems[index]['comapnyImage'] == '')
                              ? Image.asset(
                                  'assets/images/comapnyDefult.png',
                                  height: 170,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                )
                              : Image.asset('assets/images/turq.jpeg'),
                          title: Text(
                            vacancyItems[index]['jobTile'].toString(),
                            style:
                                TextStyle(fontSize: 18.sp, color: Colors.blue),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                vacancyItems[index]['comapnyName'].toString(),
                                style: TextStyle(
                                  fontSize: 15.r,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                              Text(vacancyItems[index]['jobLocation']
                                  .toString()),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => UpdateVacancy(updateJob: vacancyItems[index]),
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: const Color(0xff439A97),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    child: const Text('Update'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      primary: const Color(0xffEB455F),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
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
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
