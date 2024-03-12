part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  @override
  List<Object> get props => [];
}

class UserLoadingState extends UserState {}

class UserSuccessState extends UserState {
  final List<UserModel> users;
  UserSuccessState(this.users);
}

class UserFailureState extends UserState {
  final String? error;
  UserFailureState(this.error);
}
