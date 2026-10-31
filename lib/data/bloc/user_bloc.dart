import 'package:flutter_app/domain/entity/user.dart';
import 'package:flutter_app/domain/usecase/user_fetch_use_case.dart';
import 'package:flutter_app/domain/usecase/user_load_use_case.dart';
import 'package:flutter_app/domain/usecase/user_toggle_book_like_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

sealed class UserEvent {
  const UserEvent();
}

class UserLoadEvent extends UserEvent {
  final String id;

  const UserLoadEvent(this.id);
}

class UserRefreshEvent extends UserEvent {
  final String id;

  const UserRefreshEvent(this.id);
}

class UserResetEvent extends UserEvent {
  const UserResetEvent();
}

class UserToggleBookLikeEvent extends UserEvent {
  final String bookId;
  final String id;

  const UserToggleBookLikeEvent(this.id, this.bookId);
}

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserLoadUseCase userLoad;
  final UserFetchUseCase userFetch;
  final UserToggleBookLikeUseCase userToggleBookLike;

  UserBloc({
    required this.userLoad,
    required this.userFetch,
    required this.userToggleBookLike,
  }) : super(const UserInitialState()) {
    on<UserToggleBookLikeEvent>(_onToggleBookLike, transformer: restartable());
    on<UserResetEvent>(_onUserReset, transformer: droppable());
    on<UserRefreshEvent>(_onRefreshUser, transformer: restartable());
    on<UserLoadEvent>(_onLoadUser, transformer: droppable());
  }

  Future<void> _onToggleBookLike(
    UserToggleBookLikeEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(UserLoadedState(await userToggleBookLike(event.id, event.bookId)));
  }

  Future<void> _onUserReset(
    UserResetEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserInitialState());
  }

  Future<void> _onRefreshUser(
    UserRefreshEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserLoadingState());
    try {
      emit(UserLoadedState(await userFetch(event.id)));
    } on Object catch (e) {
      emit(UserFailureState(e));
    }
  }

  Future<void> _onLoadUser(UserLoadEvent event, Emitter<UserState> emit) async {
    emit(const UserLoadingState());
    try {
      emit(UserLoadedState(await userLoad(event.id)));
    } on Object catch (e) {
      print(e.toString());
      emit(UserFailureState(e));
    }
  }
}
