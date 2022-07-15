import 'dart:convert';
import 'dart:math';

import 'package:islands_counter/data/services/service_iteractor.dart';
import 'package:islands_counter/pages/home_status.dart';
import 'package:islands_counter/utils/island_counter_algoritm.dart';
import 'package:islands_counter/view_model.dart';

class HomeViewModel extends ViewModel<HomeStatus> {
  final ServiceInteractor _interactor;

  HomeViewModel(this._interactor) {
    status = HomeStatus(
      currentTab: 0,
      currentNavTab: 3,
      matrixSize: 0,
      islandsCount: 0,
      currentCategory: 0,
      isLoading: false,
      matrix: [],
      restaurants: [],
    );
  }

  void increaseMatrixSize() {
    status = status.copyWith(
      matrixSize: status.matrixSize + 1,
    );
    _updateMatrixSize();
  }

  void decreaseMatrixSize() {
    status = status.copyWith(
      matrixSize: status.matrixSize - 1,
    );
    _updateMatrixSize();
  }

  /// It creates a new matrix of size `status.matrixSize` and fills it with zeros
  void _updateMatrixSize() {
    final List<List<int>> newMatrix = List.generate(
      status.matrixSize,
      (int i) => List.generate(
        status.matrixSize,
        (int j) => Random().nextInt(2),
      ),
    );

    status = status.copyWith(
      matrix: [...newMatrix],
    );
    _islandCounter();
  }

  void onClickSpace(int row, int col) {
    // update the matrix in the position [row][col] with the value 1 if it is 0 or 0 if it is 1
    final List<List<int>> newMatrix = [...status.matrix];
    newMatrix[row][col] = newMatrix[row][col] == 0 ? 1 : 0;

    status = status.copyWith(
      matrix: [...newMatrix],
    );
    _islandCounter();
  }

  void _islandCounter() {
    // convert matrix to json and then to list of lists
    final List<List<int>> newMatrix = List.generate(
      status.matrix.length,
      (index) => List<int>.from(
        jsonDecode(jsonEncode(status.matrix[index])) as List<dynamic>,
      ),
    );

    final int islandsCount = IslandCounterAlgorithm.countIslands(newMatrix);
    status = status.copyWith(
      islandsCount: islandsCount,
    );
  }

  void changeTab(int index, {bool isNavTab = false}) {
    if (isNavTab) {
      status = status.copyWith(
        currentNavTab: index,
      );
    } else {
      if (index == 1) {
        getRestaurants();
      }
      status = status.copyWith(
        currentTab: index,
      );
    }
  }

  void changeCurrentCategory(int index) {
    status = status.copyWith(
      currentCategory: index,
    );
  }

  Future<void> getRestaurants() async {
    try {
      status = status.copyWith(isLoading: true);
      await _interactor.getRestaurantInfo().then((value) {
        if (value.meta.status == 200) {
          status = status.copyWith(
            restaurants: value.data,
          );
        }
      });
      status = status.copyWith(isLoading: false);
    } catch (e) {
      print('Error $e');
    }
  }
}
