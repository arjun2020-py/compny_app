import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:company/LoginScreen/view/login_scrren.dart';
import 'package:company/settingScreen/view/setting_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../shredPrefrences/view/shared_prefernces.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final _jobVacancy = FirebaseFirestore.instance.collection('company_users');
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color(0xff227C70),
      body: SafeArea(
        child: SingleChildScrollView(
          //card wrap with stream bilder
          child: StreamBuilder(
              stream: _jobVacancy.doc(_auth.currentUser!.uid).snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final userData = snapshot.data!;

                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Colors.white54,
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Colors.white,
                                        child: (userData['profileImage'] == '')
                                            ? Text(
                                                userData['companyName'][0]
                                                    .toString()
                                                    .toUpperCase(),
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blueAccent),
                                              )
                                            : ClipOval(
                                                child: Image.network(
                                                  userData['profileImage']
                                                      .toString(),
                                                  fit: BoxFit.cover,
                                                  height: 100,
                                                  width: 100,
                                                ),
                                              )),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    TextButton(
                                        onPressed: getPic,
                                        child: const Text('upload pic'))
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 220),
                                  child:
                                      Text(userData['companyName'].toString()),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 150),
                                  child: Text(userData['email'].toString()),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              leading: const Icon(Icons.person),
                              title: const Text("Company Account"),
                              trailing: IconButton(
                                  onPressed: () {
                                    ShredPref().getUserData();
                                  },
                                  icon: const Icon(Icons.navigate_next)),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              leading: const Icon(Icons.notes_rounded),
                              title: const Text("Genral Statement"),
                              trailing: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.navigate_next)),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              leading: const Icon(Icons.help_outline_rounded),
                              title: const Text(" Help Center"),
                              trailing: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.navigate_next)),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              leading: const Icon(Icons.info_outline_rounded),
                              title: const Text("About Us"),
                              trailing: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.navigate_next)),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              leading: const Icon(Icons.settings_input_antenna),
                              title: const Text(" Settings"),
                              trailing: IconButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => SettingScreen(),
                                    ));
                                  },
                                  icon: const Icon(Icons.navigate_next)),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              onTap: () {},
                              leading: const Icon(Icons.logout_outlined),
                              title: const Text("Logout"),
                              trailing: IconButton(
                                  onPressed: () {
                                    ShredPref().removeUserData();
                                    Navigator.of(context)
                                        .pushReplacement(MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
                                    ));
                                  },
                                  icon: const Icon(Icons.navigate_next)),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              }),
        ),
      ),
    );
  }

  //get images from mobile
  Future<void> getPic() async {
    final _imagepicker = ImagePicker();
    try {
      final image = await _imagepicker.pickImage(source: ImageSource.gallery);
      await updateProfilePic(image!);
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateProfilePic(XFile image) async {
    final refernce =
        FirebaseStorage.instance.ref().child('profileImage').child(image.name);
    final file = File(image.path); //assgin local path to file.
    await refernce.putFile(file);
    final imageLink = await refernce.getDownloadURL();

    await _jobVacancy
        .doc(_auth.currentUser!.uid)
        .update({'profileImage': imageLink});
    print(imageLink);
  }
}
