
import 'package:equatable/equatable.dart';

enum ScanStatus { valid, invalid, expired, alreadyUsed }

class ScanResultModel extends Equatable {
  final String ticketId;
  final String eventId;
  final ScanStatus status;
  final DateTime scannedAt;
  final String? message;
  final Map<String, dynamic>? metadata;

  const ScanResultModel({
    required this.ticketId,
    required this.eventId,
    required this.status,
    required this.scannedAt,
    this.message,
    this.metadata,
  });

  factory ScanResultModel.fromJson(Map<String, dynamic> json) {
    return ScanResultModel(
      ticketId: json['ticket_id'] as String,
      eventId: json['event_id'] as String,
      status: ScanStatus.values.firstWhere(
        (s) => s.name == json['status'],
        orElse: () => ScanStatus.invalid,
      ),
      scannedAt: DateTime.parse(json['scanned_at'] as String),
      message: json['message'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ticket_id': ticketId,
      'event_id': eventId,
      'status': status.name,
      'scanned_at': scannedAt.toIso8601String(),
      'message': message,
      'metadata': metadata,
    };
  }

  @override
  List<Object?> get props => [
    ticketId, eventId, status, scannedAt, message, metadata
  ];
}
