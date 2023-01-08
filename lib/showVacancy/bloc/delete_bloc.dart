import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'delete_event.dart';
part 'delete_state.dart';

class DeleteBloc extends Bloc<DeleteEvent, DeleteState> {
  DeleteBloc() : super(DeleteInitial()) {
    on<DeleteEvent>((event, emit) async {
      if (event is DeleteOptionEvent) {
        final _jobVacancy =
            FirebaseFirestore.instance.collection('job_vacancy');

        try {
          await _jobVacancy.doc(event.jobId).delete();

          emit(DeleteEventSucess());
        } catch (e) {
          emit(DeleteEventFailed());
        }
      }
    });
  }
}
