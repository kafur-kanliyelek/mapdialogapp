import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_dialog_app/feature2/clean_problem_model.dart';

class CleanFirebaseRepo {
  Set<Marker> markersSet = {};
  static Stream<List<CleanProblemModel>> readData() {
    final problemCollection = FirebaseFirestore.instance.collection('problems');
    var list = problemCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs
            .map((e) => CleanProblemModel.fromSnapshot(e))
            .toList());

    return list;
  }

  addSet(list) {
    list.map((list) {
      markersSet.add(Marker(
          markerId: MarkerId(list.first.id ?? ''),
          position: LatLng(
              list.first.position.latitude, list.first.position.longitude)));
    });
    return markersSet;
  }

  static createData(CleanProblemModel problem) {
    final problemCollection = FirebaseFirestore.instance.collection('problems');
    String id = problemCollection.doc().id;
    final newProblem = CleanProblemModel(
            id: id,
            option: problem.option,
            position: problem.position,
            time: problem.time,
            comment: problem.comment)
        .toJson();

    problemCollection.doc(id).set(newProblem);
  }

  static deleteData(String id) {
    final problemCollection = FirebaseFirestore.instance.collection('problems');
    problemCollection.doc(id).delete();
  }
}
