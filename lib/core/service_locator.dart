
import 'package:get_it/get_it.dart';
import '../data/repositories/app_repository.dart';
import '../data/repositories/api_repository.dart';
import '../data/repositories/fake_repository.dart';
import '../logic/app/app_bloc.dart';
import '../logic/login/login_bloc.dart';
import '../logic/event/event_bloc.dart';
import '../logic/scan/scan_bloc.dart';
import '../logic/history/history_bloc.dart';
import '../logic/profile/profile_bloc.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  // Repositories
  getIt.registerLazySingleton<ApiRepository>(() => ApiRepository());
  getIt.registerLazySingleton<AppRepository>(() => AppRepository());
  getIt.registerLazySingleton<FakeRepository>(() => FakeRepository());

  // Blocs
  getIt.registerFactory(() => AppBloc(getIt<AppRepository>()));
  getIt.registerFactory(() => LoginBloc(getIt<ApiRepository>()));
  getIt.registerFactory(() => EventBloc(getIt<ApiRepository>()));
  getIt.registerFactory(() => ScanBloc(getIt<ApiRepository>()));
  getIt.registerFactory(() => HistoryBloc(getIt<ApiRepository>()));
  getIt.registerFactory(() => ProfileBloc(getIt<ApiRepository>()));
}
