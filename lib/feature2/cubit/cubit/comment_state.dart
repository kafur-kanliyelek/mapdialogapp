part of 'comment_cubit.dart';

sealed class CommentState extends Equatable {
  final String comment;
  const CommentState(this.comment);

  @override
  List<Object> get props => [comment];
}

final class CommentInitial extends CommentState {
  CommentInitial(super.comment);

  @override
  List<Object> get props => [comment];
}
