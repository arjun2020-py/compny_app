import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:company/DashboadScreen/repostory/test.dart';
import 'package:company/DashboadScreen/view/dashboad_scren.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'dash_boad_event.dart';
part 'dash_boad_state.dart';

class DashBoadBloc extends Bloc<DashBoadEvent, DashBoadState> {
  DashBoadBloc() : super(DashBoadInitial()) {
    on<DashBoadEvent>((event, emit) async {
      print('================================$event');
      try {
        if (event is DsahBoadScreenEvent) {
          final counts = await Test().CountStatus(true);
          emit(DashBoadSucessState(totalJobs: counts));
        } else {
          emit(DashBoadFailedState());
        }
      } catch (e) {
        print('----$e');
      }
    });
  }
}
