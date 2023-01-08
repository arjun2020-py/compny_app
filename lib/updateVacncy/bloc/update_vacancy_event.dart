part of 'update_vacancy_bloc.dart';

@immutable
abstract class UpdateVacancyEvent {}

class UpdateJobVcancy extends UpdateVacancyEvent {
  UpdateJobVcancy(
      {required this.jobTile,
      required this.compName,
      required this.jobDec,
      required this.jobLoc,
      required this.minSal,
      required this.maxSal,
      required this.vacancyCount,
      required this.startDate,
      required this.endDate,
     // required this.id,
      });
  String jobTile;
  String compName;
  String jobDec;
  String jobLoc;
  String minSal;
  String maxSal;
  String vacancyCount;
  String startDate;
  String endDate;
 //String id;
}
