import '../models/models.dart';

class FakeRepository {
  // Repository pour les tests
  List<EventModel> getFakeEvents() {
    return [
      EventModel(
        id: '1',
        name: 'Concert Test',
        date: DateTime.now(),
        location: 'Venue Test',
        description: 'Event de test',
      ),
    ];
  }

  List<UserModel> getFakeUsers() {
    return [
      UserModel(
        id: '1',
        email: 'test@test.com',
        name: 'Test User',
      ),
    ];
  }
}