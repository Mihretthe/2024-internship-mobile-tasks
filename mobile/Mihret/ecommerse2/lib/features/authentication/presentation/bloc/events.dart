
import '../../domain/entity/user.dart';

class UserEvent {}

class RegisterUserEvent extends UserEvent {
  String email;
  String username;
  String password;

  RegisterUserEvent({required this.email, required this.password, required this.username});
}

class LoggedInEvent extends UserEvent{
  User user;
  LoggedInEvent(this.user);

}