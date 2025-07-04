import 'package:equatable/equatable.dart';

abstract class ScanEvent extends Equatable {
  const ScanEvent();

  @override
  List<Object> get props => [];
}

class StartScan extends ScanEvent {}

class ScanQRCode extends ScanEvent {
  final String qrCode;

  const ScanQRCode(this.qrCode);

  @override
  List<Object> get props => [qrCode];
}

class ResetScan extends ScanEvent {}