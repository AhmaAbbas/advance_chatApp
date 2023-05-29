abstract class RegisterStates{}
class InitialRegister_states extends  RegisterStates{}
class LoadingRegister_states extends  RegisterStates{}
class SuccessRegister_states extends  RegisterStates{
  String? massege;
  SuccessRegister_states({this.massege});
}
class FailureRegister_states extends  RegisterStates{
  String? massege;
  FailureRegister_states({this.massege});
}
class SuccessUserImage_states extends RegisterStates{}
class FailedUserImage_states extends RegisterStates{}
class SuccessSendingUSerData extends RegisterStates{}
class FailedSendingUSerData extends RegisterStates{
  String error;
  FailedSendingUSerData({required this.error});
}