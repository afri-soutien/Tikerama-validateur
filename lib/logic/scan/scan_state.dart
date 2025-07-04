
import 'package:equatable/equatable.dart';
import '../../data/models/scan_result_model.dart';

abstract class ScanState extends Equatable {
  const ScanState();

  @override
  List<Object> get props => [];
}

class ScanInitial extends ScanState {}

class ScanInProgress extends ScanState {}

class ScanProcessing extends ScanState {}

class ScanSuccess extends ScanState {
  final ScanResult result;

  const ScanSuccess(this.result);

  @override
  List<Object> get props => [result];
}

class ScanError extends ScanState {
  final String message;

  const ScanError(this.message);

  @override
  List<Object> get props => [message];
}
