import '../../../../core/network/network_info.dart';
import '../../domain/entity/user.dart';
import '../../domain/repository/authentication_repository.dart';
import '../data_source/local_data_source.dart';
import '../data_source/remote_data_source.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository{
  final NetworkInfoImpl networkInfo;
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  AuthenticationRepositoryImpl(this.networkInfo, this.localDataSource, this.remoteDataSource);  

  @override
  Future<bool> isSignedIn() {
    // TODO: implement isSignedIn
    throw UnimplementedError();
  }

  @override

  Future<User> logIn({String? email, String? password}) async {
    if (await networkInfo.isConnected){
        final user = await remoteDataSource.logIn( email!,  password!);
        localDataSource.cacheUser(user);
        return user;  
    }else{
      throw Exception('No internet connection');
    }
  }

  @override
  Future<void> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }

  @override
  Future<User> signUp({String? email, String? password, String? username})async {
    if (await networkInfo.isConnected){
        final user = await remoteDataSource.signUp(email!, password!, username!);
        localDataSource.cacheUser(user);
        return user;
  }else{
    throw Exception('No internet connection');
  }
  
}
}