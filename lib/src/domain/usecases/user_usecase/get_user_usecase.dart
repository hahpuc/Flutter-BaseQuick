import '../../../core/resource/data_state.dart';
import '../../../core/usecase/usecase.dart';
import '../../../data/models/params/users/user_param.dart';
import '../../../data/models/response/users/users_response.dart';
import '../../repositories/users_repository.dart';

class GetUsersUseCase
    extends UseCase<DataState<UsersResponse>, UserRequestParam> {
  final UsersRepository _usersRepository;

  GetUsersUseCase(this._usersRepository);

  @override
  Future<DataState<UsersResponse>> call({required UserRequestParam params}) {
    return _usersRepository.getUsersList(params);
  }
}
