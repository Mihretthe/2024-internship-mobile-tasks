import '../entity/user.dart';
import '../repository/authentication_repository.dart';

class SignUpUseCase{
  final AuthenticationRepository _repository;
  SignUpUseCase(this._repository);

  Future<User> call({required String email, required String password, required String username}) async {
    try{
    return await _repository.signUp(email: email, password: password, username: username);}
    catch(e){
      throw Exception('Server Failure');
    }
  }
}