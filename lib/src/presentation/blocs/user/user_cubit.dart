import '/src/domain/usecases/user_usecase/get_user_by_id_usecase.dart';

import '/src/core/resource/data_state.dart';
import '../../../data/models/response/users/users_response.dart';
import '/src/domain/usecases/user_usecase/get_user_usecase.dart';
import '/src/presentation/blocs/user/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/params/users/user_param.dart';

class UserCubit extends Cubit<UserState> {
  final GetUsersUseCase _getUsersUseCase;

  final GetUserByIdUseCase _getUserByIdUseCase;

  UserCubit(this._getUsersUseCase, this._getUserByIdUseCase)
      : super(UserInitState());

  void getUserList(int page) {
    emit(UserLoadingState());

    var params = UserRequestParam(page: page);

    _getUsersUseCase(params: params).then((data) {
      if (data is DataSuccess) {
        emit(UserGetListState(data.data ?? UsersResponse()));
      } else if (data is DataFailure) {
        emit(UserGetListFailed(data.exception?.message ?? 'Unknown error'));
      }
    });
  }

  void getUserDetail(int id) {
    emit(UserLoadingState());

    _getUserByIdUseCase(params: id).then((data) {
      if (data is DataSuccess) {
        emit(UserGetDetailSuccessState());
      } else if (data is DataFailure) {
        emit(UserGetListFailed(data.exception?.message ?? 'Unknown error'));
      }
    });
  }
}
