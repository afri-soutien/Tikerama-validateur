
import 'package:equatable/equatable.dart';
import '../../data/models/event_models.dart';

abstract class EventEvent extends Equatable {
  const EventEvent();

  @override
  List<Object> get props => [];
}

class LoadEvents extends EventEvent {}

class CreateEvent extends EventEvent {
  final Event event;

  const CreateEvent(this.event);

  @override
  List<Object> get props => [event];
}

class UpdateEvent extends EventEvent {
  final Event event;

  const UpdateEvent(this.event);

  @override
  List<Object> get props => [event];
}

class DeleteEvent extends EventEvent {
  final String eventId;

  const DeleteEvent(this.eventId);

  @override
  List<Object> get props => [eventId];
}
