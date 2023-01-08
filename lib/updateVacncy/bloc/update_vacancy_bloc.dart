import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'update_vacancy_event.dart';
part 'update_vacancy_state.dart';

class UpdateVacancyBloc extends Bloc<UpdateVacancyEvent, UpdateVacancyState> {
  UpdateVacancyBloc() : super(UpdateVacancyInitial()) {
    on<UpdateVacancyEvent>((event, emit) async {
      if (event is UpdateJobVcancy) {
        final _jobVacancy =
            FirebaseFirestore.instance.collection('job_vacancy');
        final _auth = FirebaseAuth.instance;
        final userId = _auth.currentUser!.uid;
        const uuid = Uuid();
        final addVacanyId = uuid.v4();

        try {
          await _jobVacancy.doc(addVacanyId).update({
            'jobTile': event.jobTile,
            'comapnyName': event.compName,
            'jobDecrption': event.jobDec,
            'jobLocation': event.jobLoc,
            'minSalary': event.minSal,
            'maxSalary': event.maxSal,
            'vacancyCount': event.vacancyCount,
            'startDate': event.startDate,
            'endDate': event.endDate,
          });
          emit(UpdateVacancySucess());
        } catch (e) {
          emit(UpdateVacancyFailed());
        }
      }
    });
  }
}
