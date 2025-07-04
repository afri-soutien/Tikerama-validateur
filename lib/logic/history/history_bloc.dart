import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/repositories/api_repository.dart';
import 'history_event.dart';
import 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final ApiRepository _apiRepository;

  HistoryBloc(this._apiRepository) : super(HistoryInitial()) {
    on<LoadHistory>(_onLoadHistory);
    on<ClearHistory>(_onClearHistory);
  }

  void _onLoadHistory(LoadHistory event, Emitter<HistoryState> emit) async {
    emit(HistoryLoading());
    try {
      final history = await _apiRepository.getHistory();
      emit(HistoryLoaded(history));
    } catch (e) {
      emit(HistoryError(e.toString()));
    }
  }

  void _onClearHistory(ClearHistory event, Emitter<HistoryState> emit) async {
    emit(HistoryLoading());
    try {
      await _apiRepository.clearHistory();
      emit(const HistoryLoaded([]));
    } catch (e) {
      emit(HistoryError(e.toString()));
    }
  }
}