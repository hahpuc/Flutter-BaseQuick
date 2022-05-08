import '../../data/models/params/users/user_param.dart';
import '../../data/models/response/users/users_response.dart';

import '../../core/resource/data_state.dart';

abstract class UsersRepository {
  // TODO: Add more methods

  // List API
  Future<DataState<UsersResponse>> getUsersList(UserRequestParam param);

  Future<DataState<UsersResponse>> getUserDetail(int id);
}
