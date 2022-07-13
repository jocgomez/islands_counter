import 'dart:convert';

import 'package:islands_counter/pages/home_status.dart';
import 'package:islands_counter/utils/island_counter_algoritm.dart';
import 'package:islands_counter/view_model.dart';

class HomeViewModel extends ViewModel<HomeStatus> {
  HomeViewModel() {
    status = HomeStatus(
      matrixSize: 0,
      islandsCount: 0,
      matrix: [],
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
        (int j) => 0,
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
}
