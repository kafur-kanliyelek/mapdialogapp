part of 'option_cubit.dart';

sealed class OptionState extends Equatable {
  final int selectedValue;
  const OptionState(this.selectedValue);

  @override
  List<Object> get props => [selectedValue];
}

final class OptionInitial extends OptionState {
  const OptionInitial(super.selectedValue);
}

final class OptionSelected extends OptionState {
  const OptionSelected(super.selectedValue);
}
