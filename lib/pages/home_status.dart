import 'package:islands_counter/view_model.dart';

/// {@template sign_up_status}
/// SignUpStatus description
/// {@endtemplate}
class HomeStatus extends ViewStatus {
  /// {@macro sign_up_status}
  HomeStatus({
    required this.currentTab,
    required this.currentNavTab,
    required this.matrixSize,
    required this.islandsCount,
    required this.matrix,
  });

  final int currentTab;
  final int currentNavTab;
  final int matrixSize;
  final int islandsCount;
  final List<List<int>> matrix;

  /// Creates a copy of the current SignUpStatus with property changes
  HomeStatus copyWith({
    int? currentTab,
    int? currentNavTab,
    int? matrixSize,
    int? islandsCount,
    List<List<int>>? matrix,
  }) {
    return HomeStatus(
      currentTab: currentTab ?? this.currentTab,
      currentNavTab: currentNavTab ?? this.currentNavTab,
      matrixSize: matrixSize ?? this.matrixSize,
      islandsCount: islandsCount ?? this.islandsCount,
      matrix: matrix ?? this.matrix,
    );
  }
}
