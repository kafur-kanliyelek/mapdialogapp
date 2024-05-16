import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'option_state.dart';

class OptionCubit extends Cubit<OptionState> {
  OptionCubit() : super(OptionInitial(-1));

  void updateSelectedValue(value) {
    emit(OptionSelected(value));
  }
}
