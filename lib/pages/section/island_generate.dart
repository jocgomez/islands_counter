part of '../home_view.dart';

class IslandGenerate extends StatelessWidget {
  const IslandGenerate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final HomeViewModel viewModel = context.watch<HomeViewModel>();

    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Generador de islas',
            style: textTheme.headline1!.copyWith(
              color: ColorManager.primary,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Selecciona el tamaño del mapa de NxN para luego seleccionar las zonas donde te gustaria generar las islas.',
            style: textTheme.bodyText1,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tamaño del mapa: ', style: textTheme.headline1),
              _MapSizeWidget(
                viewModel: viewModel,
                textTheme: textTheme,
              ),
            ],
          ),
          if (viewModel.status.matrixSize > 0)
            // Create a widget for each row of the matrix
            Column(
              children: [
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: viewModel.status.matrixSize,
                  ),
                  itemCount:
                      viewModel.status.matrixSize * viewModel.status.matrixSize,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    final int row = index ~/ viewModel.status.matrixSize;
                    final int col = index % viewModel.status.matrixSize;
                    return Container(
                      height: 20,
                      width: 20,
                      margin: const EdgeInsets.all(1),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: InkWell(
                        onTap: () {
                          viewModel.onClickSpace(row, col);
                        },
                        child: Image.asset(
                          viewModel.status.matrix[row][col] == 1
                              ? AssetManager.grass
                              : AssetManager.water,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
                Text(
                  'Total de islas: ${viewModel.status.islandsCount}',
                  style: textTheme.headline1,
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _MapSizeWidget extends StatelessWidget {
  final HomeViewModel viewModel;
  final TextTheme textTheme;
  const _MapSizeWidget({
    Key? key,
    required this.viewModel,
    required this.textTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          splashRadius: 15,
          icon: Icon(
            Icons.remove_circle_outline,
            color: viewModel.status.matrixSize <= 0
                ? Colors.grey
                : ColorManager.secondary,
          ),
          onPressed: viewModel.status.matrixSize <= 0
              ? null
              : () => viewModel.decreaseMatrixSize(),
        ),
        SizedBox(
          width: 15,
          child: Text(
            '${viewModel.status.matrixSize}',
            style: textTheme.headline1,
          ),
        ),
        IconButton(
          splashRadius: 15,
          icon: Icon(
            Icons.add_circle_outline,
            color: viewModel.status.matrixSize >= 7
                ? Colors.grey
                : ColorManager.secondary,
          ),
          onPressed: viewModel.status.matrixSize >= 7
              ? null
              : () => viewModel.increaseMatrixSize(),
        ),
      ],
    );
  }
}
