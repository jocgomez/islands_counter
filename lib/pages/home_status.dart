import 'package:islands_counter/domain/model/restaurant_model.dart';
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
    required this.currentCategory,
    required this.isLoading,
    required this.matrix,
    required this.restaurants,
  });

  final int currentTab;
  final int currentNavTab;
  final int matrixSize;
  final int islandsCount;
  final int currentCategory;
  final bool isLoading;
  final List<List<int>> matrix;
  final List<RestaurantModel> restaurants;

  /// Creates a copy of the current SignUpStatus with property changes
  HomeStatus copyWith({
    int? currentTab,
    int? currentNavTab,
    int? matrixSize,
    int? islandsCount,
    int? currentCategory,
    bool? isLoading,
    List<List<int>>? matrix,
    List<RestaurantModel>? restaurants,
  }) {
    return HomeStatus(
      currentTab: currentTab ?? this.currentTab,
      currentNavTab: currentNavTab ?? this.currentNavTab,
      matrixSize: matrixSize ?? this.matrixSize,
      islandsCount: islandsCount ?? this.islandsCount,
      currentCategory: currentCategory ?? this.currentCategory,
      isLoading: isLoading ?? this.isLoading,
      matrix: matrix ?? this.matrix,
      restaurants: restaurants ?? this.restaurants,
    );
  }
}
