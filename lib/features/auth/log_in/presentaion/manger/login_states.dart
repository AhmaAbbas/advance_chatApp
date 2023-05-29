abstract class Login_states{}
class InitialLogin_states extends  Login_states{}
class LoadingLogin_states extends  Login_states{}
class SuccessLogin_states extends  Login_states{}
class FailureLogin_states extends  Login_states{
  String? error;
  FailureLogin_states({this.error});
}