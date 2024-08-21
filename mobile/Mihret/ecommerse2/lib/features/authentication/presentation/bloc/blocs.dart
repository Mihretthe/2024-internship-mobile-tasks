import 'package:bloc/bloc.dart';

import '../../domain/usecases/sign_up.dart';
import 'events.dart';
import 'states.dart';

class UserBloc extends Bloc<UserEvent, UserState>{
  final SignUpUseCase signUpUseCase;
  UserBloc(super.initialState, {
    required this.signUpUseCase,
  }){
    on<RegisterUserEvent>((event, emit) async {
      emit (LoadingState());
      try{
        final user = await signUpUseCase.call(email: event.email, password: event.password, username: event.username);
        emit(UserRegisteredState(user));
      } catch (e) {
        emit(ErrorState());
      }
    },);
    on<LoggedInEvent> ((event, emit) async {
      try{
        emit(UserAuthenticatedState(event.user));
      } catch (e) {
        emit(ErrorState());      }
      
    });

  }


  
  
}