import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: UserAccountsDrawerHeader(
          accountName: Text('infoysis'),
          accountEmail: Text('infoysis@gmail.com')),
    );
  }
}
