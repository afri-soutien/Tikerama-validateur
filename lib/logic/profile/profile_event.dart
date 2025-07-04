
import 'package:equatable/equatable.dart';
import '../../data/models/user_models.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class LoadProfile extends ProfileEvent {}

class UpdateProfile extends ProfileEvent {
  final User user;

  const UpdateProfile(this.user);

  @override
  List<Object> get props => [user];
}

class LogoutProfile extends ProfileEvent {}
