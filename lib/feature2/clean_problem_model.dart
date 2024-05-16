import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class CleanProblemModel extends Equatable {
  final String? id;
  final String option;
  final GeoPoint position;
  final DateTime? time;
  final String? comment;

  const CleanProblemModel(
      {this.comment,
      this.id,
      required this.option,
      required this.position,
      required this.time});

  static CleanProblemModel fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return CleanProblemModel(
        id: snapshot['id'],
        option: snapshot['option'],
        position: snapshot['position'],
        time: (snapshot['time'] as Timestamp).toDate(),
        comment: snapshot['comment']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'option': option,
      'position': position,
      'time': time,
      'comment': comment
    };
  }

  @override
  List<Object?> get props => [option, position, time];
}
