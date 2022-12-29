part of 'add_vacancy_bloc.dart';

@immutable
abstract class AddVacancyEvent {}

class JobVacancyAdd extends AddVacancyEvent {
  JobVacancyAdd({
    required this.jobTitle,
    required this.comapnyName,
    required this.jobDerption,
    required this.JobLocation,
    required this.vacanyCount,
    required this.startDate,
    required this.endDate,
    required this.image
  });
  String jobTitle;
  String comapnyName;
  String jobDerption;
  String JobLocation;
  String vacanyCount;
  String startDate;
  String endDate;
  XFile image;
}
