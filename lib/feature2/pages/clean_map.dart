import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_dialog_app/core/constants/constants.dart';
import 'package:map_dialog_app/feature2/bloc/cleanmap_bloc.dart';
import 'package:map_dialog_app/feature2/cubit/cubit/comment_cubit.dart';
import 'package:map_dialog_app/feature2/cubit/option_cubit.dart';
import 'package:intl/intl.dart';
import 'package:map_dialog_app/feature2/widgets/add_button.dart';
import 'package:map_dialog_app/feature2/widgets/iconbutton_go_to.dart';
import 'package:map_dialog_app/feature2/widgets/option_list.dart';
import 'package:map_dialog_app/feature2/widgets/pop_button.dart';

class CleanMap extends StatelessWidget {
  List optionList = [
    'option-1',
    'option-2',
    'option-3',
    'option-4',
    'option-5',
    'option-6',
    'option-7',
    'option-8',
    'option-9',
    'option-10',
    'option-11',
    'option-12',
    'opiton-13'
  ];
  int selectedValue = 1;
  CleanMap({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MyConstants.haritaBaslik),
        actions: const [GoToIconButton()],
      ),
      body: BlocBuilder<CleanmapBloc, CleanmapState>(
        builder: (context, state) {
          if (state is CleanmapLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CleanmapFailure) {
            return const Text(MyConstants.beklenmedikHata);
          }
          if (state is CleanmapLoaded) {
            return GoogleMap(
                markers: state.problems
                    .map(
                      (e) => Marker(
                          markerId: MarkerId(e.id ?? ''),
                          position:
                              LatLng(e.position.latitude, e.position.longitude),
                          infoWindow: InfoWindow(
                              title: e.option,
                              snippet: DateFormat('dd/MM/yyyy HH:mm')
                                  .format(e.time ?? DateTime(2019)))),
                    )
                    .toSet(),
                onTap: (latlng) {
                  _showDialog(latlng, context);
                },
                initialCameraPosition: MyConstants.baslangicKonumu);
          }
          return const Center(child: LinearProgressIndicator());
        },
      ),
    );
  }

  void _showDialog(LatLng latlng, context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          String comment = '';
          TextEditingController? commentTextController =
              TextEditingController();
          return AlertDialog(
            content: BlocBuilder<OptionCubit, OptionState>(
              builder: (context, state) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    OptionsList(optionList: optionList),
                    TextField(
                      decoration: const InputDecoration(
                          hintText: MyConstants.commentHintText),
                      controller: commentTextController,
                      onChanged: (value) {
                        BlocProvider.of<CommentCubit>(context)
                            .updateComment(value);
                      },
                    ),
                  ],
                );
              },
            ),
            actions: [
              const PopButton(),
              AddButton(
                optionList: optionList,
                position: GeoPoint(latlng.latitude, latlng.longitude),
                comment: commentTextController.text,
              )
            ],
          );
        });
  }
}
