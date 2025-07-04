import 'package:dio/dio.dart';
import '../models/models.dart';

class ApiRepository {
  final Dio _dio = Dio();
  final String baseUrl = 'https://api.tikerama.com';

  Future<User> login(String email, String password) async {
    // Implémentation du login
    throw UnimplementedError();
  }

  Future<void> logout() async {
    // Implémentation du logout
    throw UnimplementedError();
  }

  Future<List<Event>> getEvents() async {
    // Implémentation pour récupérer les événements
    throw UnimplementedError();
  }

  Future<ScanResult> validateTicket(String qrCode) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    // Return fake validation result
    return ScanResult(
      isValid: true,
      ticketId: qrCode,
      eventName: 'Event Test',
      scanTime: DateTime.now(),
      message: 'Ticket valide',
    );
  }

  Future<List<ScanResult>> getHistory() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      ScanResult(
        isValid: true,
        ticketId: 'TK001',
        eventName: 'Concert Jazz',
        scanTime: DateTime.now().subtract(const Duration(days: 1)),
        message: 'Ticket valide',
      ),
      ScanResult(
        isValid: false,
        ticketId: 'TK002',
        eventName: 'Festival Rock',
        scanTime: DateTime.now().subtract(const Duration(days: 2)),
        message: 'Ticket invalide',
      ),
    ];
  }

  Future<void> clearHistory() async {
    await Future.delayed(const Duration(seconds: 1));
    // Clear history logic
  }

  Future<User?> getCurrentUser() async {
    await Future.delayed(const Duration(seconds: 1));
    return User(
      id: '1',
      email: 'user@example.com',
      name: 'Test User',
      role: 'validator',
    );
  }

  Future<User> updateUser(User user) async {
    await Future.delayed(const Duration(seconds: 1));
    return user;
  }

  // Future<void> logout() async {
  //   await Future.delayed(const Duration(seconds: 1));
  //   // Logout logic
  // }

  Future<List<ScanResult>> getScanHistory() async {
    // Implémentation pour récupérer l'historique
    throw UnimplementedError();
  }
}