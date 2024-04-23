import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'historic_location_event.dart';
part 'historic_location_state.dart';


class HistoricLocationBloc extends Bloc<HistoricLocationEvent, HistoricLocationState> {
  
  HistoricLocationBloc() : super(const HistoricLocationState()) {
    
    /* on<HistoricLocationEvent>((event, emit) {

    }); */

    on<NewLocation>(_onNewLocationHandler);

    /* locationBloc.steam.ref.listen(state) {
      print( state.location);
    }; */
  }


  void onNewUserLocation( (double lat, double lng) location ) {
    add( NewLocation( location ) );
  }


  void _onNewLocationHandler( NewLocation event, Emitter<HistoricLocationState> emit ) {
    emit( state.copyWith(
      locations: [ ...state.locations, event.location ]
    ));
  }
}
