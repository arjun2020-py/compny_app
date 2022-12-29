import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

part 'add_vacancy_event.dart';
part 'add_vacancy_state.dart';

class AddVacancyBloc extends Bloc<AddVacancyEvent, AddVacancyState> {
  AddVacancyBloc() : super(AddVacancyInitial()) {
    on<AddVacancyEvent>((event, emit) async {
      if (event is JobVacancyAdd) {
        final _jobVacancy =
            FirebaseFirestore.instance.collection('job_vacancy');
        final _auth = FirebaseAuth.instance;

        final userId = _auth.currentUser!.uid;
        const uuid = Uuid();
        final addVacanyId = uuid.v4();

        final refernce = FirebaseStorage.instance
            .ref()
            .child('companyImage')
            .child(event.image.path);

        final file = File(event.image.path);
        await refernce.putFile(file);

        final imageLink = await refernce.getDownloadURL();

        await _jobVacancy.doc(addVacanyId).set({
          'userid': userId,
          'addVacanyId': addVacanyId,
          'jobTile': event.jobTitle,
          'comapnyName': event.comapnyName,
          'jobDecrption': event.jobDerption,
          'jobLocation': event.JobLocation,
          'vacancyCount': event.vacanyCount,
          'startDate': event.startDate,
          'endDate': event.endDate,
          'comapnyImage': imageLink
        });

        emit(JobAddedSucess());
      } else {
        emit(JobAddFailed());
      }
    });
  }
}
