import '../datasources/remote/services/users_api_service.dart';

import '../../core/resource/data_state.dart';
import '../../domain/repositories/users_repository.dart';
import '../models/params/users/user_param.dart';
import '../models/response/users/users_response.dart';

class UsersRepositoryImpl implements UsersRepository {
  final UsersApiService _usersApiService;

  UsersRepositoryImpl(this._usersApiService);

  @override
  Future<DataState<UsersResponse>> getUsersList(UserRequestParam param) {
    return _usersApiService.getUsersList(param);
  }

  @override
  Future<DataState<UsersResponse>> getUserDetail(int id) {
    return _usersApiService.getUserById(id);
  }
}
