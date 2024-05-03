abstract class Login_States {}

class Login_Initial_State extends Login_States {}

class Login_password_State extends Login_States {}

class Login_Loding_State extends Login_States {}
class Login_Success_State extends Login_States {
  String? uId;
  Login_Success_State({required this.uId});
}
class Login_Error_State extends Login_States {}