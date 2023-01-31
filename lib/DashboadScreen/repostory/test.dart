import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Test {
  Future<int> CountStatus(bool type) async {
    print('dfkghdfkgjhdkfgjhdfkjg');
    final _auth = FirebaseAuth.instance;
    final QuerySnapshot totalUsers = await FirebaseFirestore.instance
        .collection('job_vacancy')
        // .where('userId', isEqualTo: _auth.currentUser!.uid)
        .get();
    final userCount = totalUsers.docs.length;
    return userCount;
  }
}
