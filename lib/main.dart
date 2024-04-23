import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blocs_app/config/config.dart';
import 'package:blocs_app/presentation/blocs/blocs.dart';

void main(){
  serviceLocatorInit();

  runApp(const BlocsProviders());
}


class BlocsProviders extends StatelessWidget {
  const BlocsProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //BlocProvider(create: (context) => UsernameCubit(), lazy: false, ),
        //BlocProvider(create: (context) => UsernameCubit() ),
        //BlocProvider(create: (context) => RouterSimpleCubit() ),
        //BlocProvider(create: (context) => CounterCubit() ),
        //BlocProvider(create: (context) => ThemeCubit() ),
        //BlocProvider(create: (context) => GuestsBloc() ),
        //BlocProvider(create: (context) => PokemonBloc() ),

        
        BlocProvider(create: (context) => getIt<UsernameCubit>() ),
        BlocProvider(create: (context) => getIt<RouterSimpleCubit>() ),
        BlocProvider(create: (context) => getIt<CounterCubit>() ),
        BlocProvider(create: (context) => getIt<ThemeCubit>() ),
        BlocProvider(create: (context) => getIt<GuestsBloc>() ),
        BlocProvider(create: (context) => getIt<PokemonBloc>() ),
        BlocProvider(create: (context) => getIt<GeolocationCubit>() ),
        BlocProvider(create: (context) => getIt<HistoricLocationBloc>() ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final appRouter = context.watch<RouterSimpleCubit>().state;
    final appTheme = context.watch<ThemeCubit>().state;


    return MaterialApp.router(
      title: 'Flutter BLoC',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme( isDarkmode: appTheme.isDarkmode ).getTheme(),
    );
  }
}
