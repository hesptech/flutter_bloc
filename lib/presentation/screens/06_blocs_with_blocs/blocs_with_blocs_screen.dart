import 'package:blocs_app/presentation/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BlocsWithBlocsScreen extends StatelessWidget {
  const BlocsWithBlocsScreen({super.key});

  @override
  Widget build(BuildContext context) {


    // final geolocationCubit = context.watch<GeolocationCubit>().state.location;
    final historicLocationBloc = context.watch<HistoricLocationBloc>();
    final locationState = historicLocationBloc.state;

    var revList = locationState.locations.reversed.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Ubicaciones: ${ locationState.howManyLocations }'),
      ),
      /* body: Center(
        child: Text('$geolocationCubit'),
      ), */
      body: ListView.builder(
        shrinkWrap: true,
        //reverse: true,
        itemCount: locationState.howManyLocations,
        itemBuilder: (BuildContext context, int index) {
          //final location = locationState.locations[index];
          final location = revList[index];
          final (lat, lng) = location;

          return ListTile(
            title: Text('Lat: $lat, Lng: $lng'),
          );
        },
      ),
    );
  }
}