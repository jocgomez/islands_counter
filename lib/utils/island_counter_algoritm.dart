class IslandCounterAlgorithm {
  /// We start from the first row and first column and if we find a 1, we change it to 0 and then
  /// recursively call the function on all the 8 neighbours of the current cell
  ///
  /// Args:
  ///   matrix (List<List<int>>): the matrix we're working with
  ///
  /// Returns:
  ///   The number of islands in the matrix.
  static int countIslands(List<List<int>> matrix) {
    final List<List<int>> copyMatrix = matrix.toList();

    final int row = copyMatrix.length;
    final int col = copyMatrix[0].length;
    int count = 0;

    for (int i = 0; i < row; i++) {
      for (int j = 0; j < col; j++) {
        if (copyMatrix[i][j] == 1) {
          copyMatrix[i][j] = 0;
          count++;
          _dfs(copyMatrix, i + 1, j, row, col);
          _dfs(copyMatrix, i - 1, j, row, col);
          _dfs(copyMatrix, i, j + 1, row, col);
          _dfs(copyMatrix, i, j - 1, row, col);
          _dfs(copyMatrix, i + 1, j + 1, row, col);
          _dfs(copyMatrix, i - 1, j - 1, row, col);
          _dfs(copyMatrix, i + 1, j - 1, row, col);
          _dfs(copyMatrix, i - 1, j + 1, row, col);
        }
      }
    }
    return count;
  }

  /// We are checking if the current cell is out of bounds or if it is not a 1. If it is, we return
  ///
  /// Args:
  ///   matrix (List<List<int>>): The matrix that we are currently working on.
  ///   i (int): The current row index.
  ///   j (int): The column index of the current cell.
  ///   row (int): The number of rows in the matrix.
  ///   col (int): The number of columns in the matrix.
  ///
  /// Returns:
  ///   The number of islands in the matrix.
  static void _dfs(List<List<int>> matrix, int i, int j, int row, int col) {
    /// Checking if the current cell is out of bounds or if it is not a 1. If it is, we
    /// return.
    if (((((i < 0) || (j < 0)) || (i > (row - 1))) || (j > (col - 1))) ||
        (matrix[i][j] != 1)) {
      return;
    }

    if (matrix[i][j] == 1) {
      matrix[i][j] = 0;
      _dfs(matrix, i + 1, j, row, col);
      _dfs(matrix, i - 1, j, row, col);
      _dfs(matrix, i, j + 1, row, col);
      _dfs(matrix, i, j - 1, row, col);
      _dfs(matrix, i + 1, j + 1, row, col);
      _dfs(matrix, i - 1, j - 1, row, col);
      _dfs(matrix, i + 1, j - 1, row, col);
      _dfs(matrix, i - 1, j + 1, row, col);
    }
  }
}
