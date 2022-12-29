part of 'siginup_auth_bloc.dart';

@immutable
abstract class SiginupAuthEvent {}

class SiginupEvent extends SiginupAuthEvent {
  SiginupEvent(
      {required this.emailid,
      required this.companyName,
      required this.companyAddress,
      required this.city,
      required this.contactNo,
      required this.pass,
      required this.confromPass});

  String emailid;
  String companyName;
  String companyAddress;
  String city;
  String contactNo;
  String pass;
  String confromPass;
}
