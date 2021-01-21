part of 'cam_filter_cubit.dart';

@immutable
abstract class CamFilterState {}

class CamFilterInitial extends CamFilterState {}

class UpdatedCamFilter extends CamFilterState {
  final String selected;
  final List<String> options;

  UpdatedCamFilter(
    this.selected,
    this.options,
  );

  UpdatedCamFilter copyWith({
    String selected,
    List<String> options,
  }) {
    if ((selected == null || identical(selected, this.selected)) &&
        (options == null || identical(options, this.options))) {
      return this;
    }

    return new UpdatedCamFilter(
      selected ?? this.selected,
      options ?? this.options,
    );
  }

  @override
  String toString() {
    return 'UpdatedCamFilter{selected: $selected, options: $options}';
  }
}
