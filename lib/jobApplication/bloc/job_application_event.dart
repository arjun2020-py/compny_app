part of 'job_application_bloc.dart';

@immutable
abstract class JobApplicationEvent {}

class JobApplicationCollection extends JobApplicationEvent {
  JobApplicationCollection({
    required this.status,
    //required this.jobId
  });
  String status;
  // String jobId;
}
