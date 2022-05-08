import '../../../core/resource/data_state.dart';
import '../../../core/usecase/usecase.dart';
import '../../../data/models/response/users/users_response.dart';
import '../../repositories/users_repository.dart';

class GetUserByIdUseCase extends UseCase<DataState<UsersResponse>, int> {
  final UsersRepository _usersRepository;

  GetUserByIdUseCase(this._usersRepository);

  @override
  Future<DataState<UsersResponse>> call({required int params}) {
    return _usersRepository.getUserDetail(params);
  }
}
