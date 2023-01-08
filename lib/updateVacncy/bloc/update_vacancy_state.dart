part of 'update_vacancy_bloc.dart';

@immutable
abstract class UpdateVacancyState {}

class UpdateVacancyInitial extends UpdateVacancyState {}

class UpdateVacancySucess extends UpdateVacancyState {}

class UpdateVacancyFailed extends UpdateVacancyState {}


