
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/repositories/app_repository.dart';
import 'app_event.dart';
import 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AppRepository _repository;

  AppBloc(this._repository) : super(AppInitial()) {
    on<AppStarted>(_onAppStarted);
    on<AppUserLoggedIn>(_onUserLoggedIn);
    on<AppUserLoggedOut>(_onUserLoggedOut);
  }

  void _onAppStarted(AppStarted event, Emitter<AppState> emit) async {
    emit(AppLoading());
    try {
      final isLoggedIn = await _repository.isUserLoggedIn();
      if (isLoggedIn) {
        emit(AppAuthenticated());
      } else {
        emit(AppUnauthenticated());
      }
    } catch (e) {
      emit(AppError(e.toString()));
    }
  }

  void _onUserLoggedIn(AppUserLoggedIn event, Emitter<AppState> emit) {
    emit(AppAuthenticated());
  }

  void _onUserLoggedOut(AppUserLoggedOut event, Emitter<AppState> emit) {
    emit(AppUnauthenticated());
  }
}
