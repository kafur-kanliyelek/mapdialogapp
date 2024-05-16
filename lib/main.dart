import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_dialog_app/feature2/bloc/cleanmap_bloc.dart';
import 'package:map_dialog_app/feature2/cubit/cubit/comment_cubit.dart';
import 'package:map_dialog_app/feature2/pages/clean_map.dart';
import 'package:map_dialog_app/feature2/cubit/option_cubit.dart';
import 'package:map_dialog_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CleanmapBloc>(
          create: (context) => CleanmapBloc()..add(ReadDataEvent()),
        ),
        BlocProvider<OptionCubit>(
          create: (context) => OptionCubit(),
        ),
        BlocProvider<CommentCubit>(create: ((context) => CommentCubit()))
      ],
      child: MaterialApp(
        title: 'Flutter Map Dialog',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: CleanMap(),
      ),
    );
  }
}
