import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:map_dialog_app/feature2/clean_firebase_repo.dart';
import 'package:map_dialog_app/feature2/clean_problem_model.dart';

part 'cleanmap_event.dart';
part 'cleanmap_state.dart';

class CleanmapBloc extends Bloc<CleanmapEvent, CleanmapState> {
  StreamSubscription<List<CleanProblemModel>>? _problemStreamSubscription;

  @override
  Future<void> close() async {
    await _problemStreamSubscription!.cancel();

    return super.close();
  }

  CleanmapBloc() : super(CleanmapInitial()) {
    on<ReadDataEvent>((event, emit) {
      try {
        emit(CleanmapLoading());
        final streamResponse = CleanFirebaseRepo.readData();
        _problemStreamSubscription?.cancel();

        _problemStreamSubscription = streamResponse.listen((problems) {
          add(LoadDataEvent(
            problems: problems,
          ));
        });
      } catch (e) {
        emit(CleanmapFailure());
      }
    });
    on<LoadDataEvent>((event, emit) {
      try {
        Set<Marker> mySet = CleanFirebaseRepo().markersSet;
        event.problems.map((e) {
          return mySet.add(
            Marker(
                markerId: MarkerId(e.id ?? ''),
                position: LatLng(e.position.latitude, e.position.longitude)),
          );
        });

        emit(CleanmapLoaded(
          problems: event.problems,
        ));
      } catch (e) {
        emit(CleanmapFailure());
      }
    });
    on<CreateDataEvent>((event, emit) {
      try {
        if (state is CleanmapLoaded) {
          CleanFirebaseRepo.createData(event.problem);
        }
      } catch (e) {
        emit(CleanmapFailure());
      }
    });
    on<DeleteDataEvent>((event, emit) {
      try {
        if (state is CleanmapLoaded) {
          CleanFirebaseRepo.deleteData(event.id);
        }
      } catch (e) {
        emit(CleanmapFailure());
      }
    });
  }
}
