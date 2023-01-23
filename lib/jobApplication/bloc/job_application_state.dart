part of 'job_application_bloc.dart';

@immutable
abstract class JobApplicationState {}

class JobApplicationInitial extends JobApplicationState {}

class JobApplictionSucesses extends JobApplicationState {
  
}

class JobApplicationFailed extends JobApplicationState {
  
}
