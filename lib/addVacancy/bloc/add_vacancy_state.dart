part of 'add_vacancy_bloc.dart';

@immutable
abstract class AddVacancyState {}

class AddVacancyInitial extends AddVacancyState {}

class JobAddedSucess extends AddVacancyState {}

class JobAddFailed extends AddVacancyState {}
