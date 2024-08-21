import '../../domain/entity/user.dart';

class UserState {}

class UserAuthenticatedState extends UserState{
  final User user;
  UserAuthenticatedState(this.user);

}

class LoadingState extends UserState {}

class ErrorState extends UserState {}

class UserRegisteredState extends UserState{
  final User user;
  UserRegisteredState(this.user);
}