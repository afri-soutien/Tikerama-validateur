import 'package:equatable/equatable.dart';

class EventModel extends Equatable {
  final String id;
  final String name;
  final String description;
  final DateTime date;
  final String location;
  final String? imageUrl;
  final int? maxCapacity;
  final bool isActive;

  const EventModel({
    required this.id,
    required this.name,
    required this.description,
    required this.date,
    required this.location,
    this.imageUrl,
    this.maxCapacity,
    this.isActive = true,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      date: DateTime.parse(json['date'] as String),
      location: json['location'] as String,
      imageUrl: json['image_url'] as String?,
      maxCapacity: json['max_capacity'] as int?,
      isActive: json['is_active'] as bool? ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'date': date.toIso8601String(),
      'location': location,
      'image_url': imageUrl,
      'max_capacity': maxCapacity,
      'is_active': isActive,
    };
  }

  @override
  List<Object?> get props => [
    id, name, description, date, location, imageUrl, maxCapacity, isActive
  ];
}