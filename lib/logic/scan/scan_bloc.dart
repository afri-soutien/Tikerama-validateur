import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/repositories/api_repository.dart';
import 'scan_event.dart';
import 'scan_state.dart';

class ScanBloc extends Bloc<ScanEvent, ScanState> {
  final ApiRepository _repository;

  ScanBloc(this._repository) : super(ScanInitial()) {
    on<StartScan>(_onStartScan);
    on<ScanQRCode>(_onScanQRCode);
    on<ResetScan>(_onResetScan);
  }

  void _onStartScan(StartScan event, Emitter<ScanState> emit) {
    emit(ScanInProgress());
  }

  void _onScanQRCode(ScanQRCode event, Emitter<ScanState> emit) async {
    emit(ScanProcessing());
    try {
      final result = await _repository.validateTicket(event.qrCode);
      emit(ScanSuccess(result));
    } catch (e) {
      emit(ScanError(e.toString()));
    }
  }

  void _onResetScan(ResetScan event, Emitter<ScanState> emit) {
    emit(ScanInitial());
  }
}