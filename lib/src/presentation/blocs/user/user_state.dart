import '../../../data/models/response/users/users_response.dart';
import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {
  @override
  List<Object> get props => [];
}

class UserInitState extends UserState {}

class UserLoadingState extends UserState {}

class UserGetListState extends UserState {
  final UsersResponse data;

  UserGetListState(this.data);
}

class UserGetListFailed extends UserState {
  final String error;

  UserGetListFailed(this.error);
}

class UserGetDetailSuccessState extends UserState {}
