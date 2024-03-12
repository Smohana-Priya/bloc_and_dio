// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:bloc_and_dio/repo.dart';
import 'package:bloc_and_dio/user_model.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final Repository repo;
  UserBloc(this.repo) : super(UserLoadingState()) {
    on<UserEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final List<UserModel> data = await repo.getUsers();

        emit(UserSuccessState(data));
      } catch (e) {
        print(e);
        emit(UserFailureState(e.toString()));
      }
    });
  }
}
