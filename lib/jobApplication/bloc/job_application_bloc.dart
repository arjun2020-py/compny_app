import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'job_application_event.dart';
part 'job_application_state.dart';

class JobApplicationBloc
    extends Bloc<JobApplicationEvent, JobApplicationState> {
  JobApplicationBloc() : super(JobApplicationInitial()) {
    on<JobApplicationEvent>((event, emit) async {
      if (event is JobApplicationCollection) {
        CollectionReference jobApplicationCollection =
            FirebaseFirestore.instance.collection('job_application');

        final _auth = FirebaseAuth.instance;

        await jobApplicationCollection
            .doc(_auth.currentUser!.uid)
            .set({'status': event.status, 'userId': _auth.currentUser!.uid});

        emit(JobApplictionSucesses());
      } else {
        emit(JobApplicationFailed());
      }
    });
  }
}
