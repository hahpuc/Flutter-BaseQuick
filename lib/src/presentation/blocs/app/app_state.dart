import 'package:equatable/equatable.dart';

abstract class AppState extends Equatable {
  @override
  List<Object> get props => [];
}

class AppInitial extends AppState {}

class AppShowError extends AppState {
  final String? errorMessage;

  AppShowError(this.errorMessage);
}

//class AppLoggedIn extends AppState {}

//class AppLoggedOut extends AppState {}
