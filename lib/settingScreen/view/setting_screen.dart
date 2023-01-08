import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          
        }, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              leading: const Icon(Icons.info_outline_rounded),
              title: const Text("About Us"),
              trailing: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.navigate_next)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              leading: const Icon(Icons.info_outline_rounded),
              title: const Text("privacy"),
              trailing: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.navigate_next)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              leading: const Icon(Icons.info_outline_rounded),
              title: const Text("language"),
              trailing: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.navigate_next)),
            ),
          ),
        ],
      ),
    );
  }
}
