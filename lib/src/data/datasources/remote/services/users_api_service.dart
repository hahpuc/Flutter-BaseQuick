import '../../../../core/resource/data_state.dart';
import '../../../../core/exception/network_exception.dart';
import '../../../models/params/users/user_param.dart';
import '../../../models/response/users/users_response.dart';
import '../dio_helper.dart';
import '../end_points.dart';

class UsersApiService {
  final DioHelper _dioHelper;

  UsersApiService(this._dioHelper);

  Future<DataState<UsersResponse>> getUsersList(UserRequestParam param) async {
    try {
      var response = await _dioHelper.get(
        EndPoints.users + "?page=${param.page}",
      );

      return DataSuccess(UsersResponse.fromJson(response));
    } catch (e) {
      return DataFailure(await NetworkException.getNetworkException(e));
    }
  }

  Future<DataState<UsersResponse>> getUserById(int id) async {
    try {
      var response = await _dioHelper.get(EndPoints.users + "/$id");

      return DataSuccess(UsersResponse.fromJson(response));
    } catch (e) {
      return DataFailure(await NetworkException.getNetworkException(e));
    }
  }
}
