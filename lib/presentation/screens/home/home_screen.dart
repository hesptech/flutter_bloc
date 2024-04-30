import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mini-Curso: Flutter BLoC (+Cubit)'),
      ),
      body: const _HomeScreenView(),
    );
  }
}

class _HomeScreenView extends StatelessWidget {
  const _HomeScreenView();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [

        _CustomListTile(
            title: '01 - Cubit simple',
            subTitle: 'BlocBuilder',
            location: '/simple-cubit'),

        _CustomListTile(
            title: 'GoRouter - Cubit (+ GoRouter)',
            subTitle: 'routing',
            location: '/cubit-router'),

        _CustomListTile(
            title: '03 - Cubits Multiples',
            subTitle: 'Theme, NameGenerator, Counter',
            location: '/cubit-state'),

        _CustomListTile(
            title: '04 - BLoC - GuestBloc - Manejo invitados',
            subTitle: 'SegmentedButton, Filters, SwitchListTile, NameGenerator',
            location: '/guest-bloc'),

        _CustomListTile(
            title: '05 - BLoC Pokemon',
            subTitle: 'FutureBuilder, caché, setState, Map containsKey',
            location: '/pokemon-bloc'),

        _CustomListTile(
            title: '06/07 - BLoCs depended with other BLoCs',
            subTitle: 'reversed.toList(), Google Maps Routes Geolocator.getPositionStream  \nGetIt BLoC geolocation instance passes BLoC historic function to BLOC geolocation to method which calls it',
            location: '/blocs-with-blocs'),

      ],
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final String location;

  const _CustomListTile({
    required this.title,
    required this.subTitle,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      onTap: () => context.push(location),
    );
  }
}
