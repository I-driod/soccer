import '../data/remote/auth_api_service.dart';

abstract class AuthRepository {
  Future<void> login(String email, String password);

  Future<void> getTeams();
}

class AuthRepositoryImpl extends AuthRepository {
  final AuthApiService _authApiService;

  AuthRepositoryImpl(this._authApiService);

  @override
  Future<void> login(String email, String password) async {
    await _authApiService.login(email, password);
  }

  @override
  Future<void> getTeams() async {
    // await _authApiService.fetchTeams();
  }
}
