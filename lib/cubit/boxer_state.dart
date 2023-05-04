part of 'boxer_cubit.dart';

class BoxerState extends Equatable {
  final double laminationCalculation;
  final double boardCalculation;
  final double printingCalculation;
  final double pastingCalculation;
  final double dieCuttingCalculation;
  final double stitchingCalculation;
  final double conversionCalculation;
  final double finalCalculation;
  final double profitCalculation;

  const BoxerState({
    required this.profitCalculation,
    required this.laminationCalculation,
    required this.boardCalculation,
    required this.printingCalculation,
    required this.pastingCalculation,
    required this.dieCuttingCalculation,
    required this.stitchingCalculation,
    required this.conversionCalculation,
    required this.finalCalculation,
  });

  @override
  List<Object> get props => [
        laminationCalculation,
        boardCalculation,
        printingCalculation,
        pastingCalculation,
        dieCuttingCalculation,
        stitchingCalculation,
        conversionCalculation,
        finalCalculation,
        profitCalculation,
      ];

  BoxerState copyWith({
    double? laminationCalculation,
    double? boardCalculation,
    double? printingCalculation,
    double? pastingCalculation,
    double? dieCuttingCalculation,
    double? stitchingCalculation,
    double? conversionCalculation,
    double? finalCalculation,
    double? profitCalculation,
  }) {
    return BoxerState(
      laminationCalculation:
          laminationCalculation ?? this.laminationCalculation,
      boardCalculation: boardCalculation ?? this.boardCalculation,
      printingCalculation: printingCalculation ?? this.printingCalculation,
      pastingCalculation: pastingCalculation ?? this.pastingCalculation,
      dieCuttingCalculation:
          dieCuttingCalculation ?? this.dieCuttingCalculation,
      stitchingCalculation: stitchingCalculation ?? this.stitchingCalculation,
      conversionCalculation:
          conversionCalculation ?? this.conversionCalculation,
      finalCalculation: finalCalculation ?? this.finalCalculation,
      profitCalculation: profitCalculation ?? this.profitCalculation,
    );
  }
}
