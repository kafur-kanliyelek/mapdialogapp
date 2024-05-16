part of 'cleanmap_bloc.dart';

sealed class CleanmapState extends Equatable {
  const CleanmapState();

  @override
  List<Object> get props => [];
}

final class CleanmapInitial extends CleanmapState {
  @override
  List<Object> get props => [];
}

final class CleanmapLoading extends CleanmapState {
  @override
  List<Object> get props => [];
}

final class CleanmapLoaded extends CleanmapState {
  final List<CleanProblemModel> problems;
  final Set<Marker>? markerSet;

  const CleanmapLoaded({this.markerSet, required this.problems});
  @override
  List<Object> get props => [problems];
}

final class CleanmapFailure extends CleanmapState {
  @override
  List<Object> get props => [];
}
