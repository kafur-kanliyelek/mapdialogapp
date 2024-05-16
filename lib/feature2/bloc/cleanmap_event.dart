part of 'cleanmap_bloc.dart';

sealed class CleanmapEvent extends Equatable {
  const CleanmapEvent();

  @override
  List<Object> get props => [];
}

class CreateDataEvent extends CleanmapEvent {
  final CleanProblemModel problem;

  const CreateDataEvent({required this.problem});
  @override
  List<Object> get props => [problem];
}

class ReadDataEvent extends CleanmapEvent {
  @override
  List<Object> get props => [];
}

class LoadDataEvent extends CleanmapEvent {
  final List<CleanProblemModel> problems;

  const LoadDataEvent({required this.problems});
  @override
  List<Object> get props => [problems];
}

class DeleteDataEvent extends CleanmapEvent {
  final String id;

  const DeleteDataEvent({required this.id});
  @override
  List<Object> get props => [id];
}

class OptionChanged extends CleanmapEvent {
  final int option;

  const OptionChanged({required this.option});
  @override
  List<Object> get props => [option];
}
