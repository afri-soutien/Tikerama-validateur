
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../presentation/screens/screens.dart';
import '../logic/logic.dart';
import 'service_locator.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<LoginBloc>(),
        child: const LoginScreen(),
      ),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/forgot-password',
      builder: (context, state) => const ForgotPasswordScreen(),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt<AppBloc>()),
          BlocProvider(create: (context) => getIt<EventBloc>()),
        ],
        child: const DashboardScreen(),
      ),
    ),
    GoRoute(
      path: '/scan',
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<ScanBloc>(),
        child: const ScanScreen(),
      ),
    ),
    GoRoute(
      path: '/events',
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<EventBloc>(),
        child: const EventListScreen(),
      ),
    ),
    GoRoute(
      path: '/add-event',
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<EventBloc>(),
        child: const AddEventScreen(),
      ),
    ),
    GoRoute(
      path: '/history',
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<HistoryBloc>(),
        child: const HistoryScreen(),
      ),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<ProfileBloc>(),
        child: const ProfileScreen(),
      ),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
  ],
);
