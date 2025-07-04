
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/repositories/api_repository.dart';
import 'event_event.dart';
import 'event_state.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  final ApiRepository _repository;

  EventBloc(this._repository) : super(EventInitial()) {
    on<LoadEvents>(_onLoadEvents);
    on<CreateEvent>(_onCreateEvent);
    on<UpdateEvent>(_onUpdateEvent);
    on<DeleteEvent>(_onDeleteEvent);
  }

  void _onLoadEvents(LoadEvents event, Emitter<EventState> emit) async {
    emit(EventLoading());
    try {
      final events = await _repository.getEvents();
      emit(EventLoaded(events));
    } catch (e) {
      emit(EventError(e.toString()));
    }
  }

  void _onCreateEvent(CreateEvent event, Emitter<EventState> emit) async {
    emit(EventLoading());
    try {
      await _repository.createEvent(event.event);
      final events = await _repository.getEvents();
      emit(EventLoaded(events));
    } catch (e) {
      emit(EventError(e.toString()));
    }
  }

  void _onUpdateEvent(UpdateEvent event, Emitter<EventState> emit) async {
    emit(EventLoading());
    try {
      await _repository.updateEvent(event.event);
      final events = await _repository.getEvents();
      emit(EventLoaded(events));
    } catch (e) {
      emit(EventError(e.toString()));
    }
  }

  void _onDeleteEvent(DeleteEvent event, Emitter<EventState> emit) async {
    emit(EventLoading());
    try {
      await _repository.deleteEvent(event.eventId);
      final events = await _repository.getEvents();
      emit(EventLoaded(events));
    } catch (e) {
      emit(EventError(e.toString()));
    }
  }
}
