import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'siginup_auth_event.dart';
part 'siginup_auth_state.dart';

class SiginupAuthBloc extends Bloc<SiginupAuthEvent, SiginupAuthState> {
  SiginupAuthBloc() : super(SiginupAuthInitial()) {
    on<SiginupAuthEvent>((event, emit) async {
      if (event is SiginupEvent) {
        final auth = FirebaseAuth.instance;
        final companyUserRef =
            FirebaseFirestore.instance.collection('company_users');

        try {
          await auth.createUserWithEmailAndPassword(
              email: event.emailid, password: event.pass);

          await companyUserRef.doc(auth.currentUser!.uid).set({
            'userId': auth.currentUser!.uid,
            'email': event.emailid,
            'companyName': event.companyName,
            'companyAddress': event.companyAddress,
            'city': event.city,
            'contactNo': event.contactNo,
            'passwrod': event.pass,
            'confromPass': event.confromPass,
            'profileImage': '',
          });
          emit(SiginupSucess());
        } catch (e) {
          emit(SiginupFailed());
        }
      }
    });
  }
}
