part of 'dash_boad_bloc.dart';

@immutable
abstract class DashBoadState {}

class DashBoadInitial extends DashBoadState {}

class DashBoadSucessState extends DashBoadState {
  DashBoadSucessState({required this.totalJobs});
  int totalJobs;
}

class DashBoadFailedState extends DashBoadState {}
