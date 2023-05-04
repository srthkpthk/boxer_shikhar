import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'boxer_state.dart';

class BoxerCubit extends Cubit<BoxerState> {
  BoxerCubit()
      : super(const BoxerState(
          laminationCalculation: 0,
          boardCalculation: 0,
          printingCalculation: 0,
          pastingCalculation: 0,
          dieCuttingCalculation: 0,
          stitchingCalculation: 0,
          conversionCalculation: 0,
          finalCalculation: 0,
          profitCalculation: 0,
        ));

  Future<void> addBoardCalculation(double calculation) async {
    emit(state.copyWith(boardCalculation: calculation));
  }

  Future<void> addLaminationCalculation(double calculation) async {
    emit(state.copyWith(laminationCalculation: calculation));
  }

  Future<void> addPrintingCalculation(double calculation) async {
    emit(state.copyWith(printingCalculation: calculation));
  }

  Future<void> addPastingCalculation(double calculation) async {
    emit(state.copyWith(pastingCalculation: calculation));
  }

  Future<void> addDieCuttingCalculation(double calculation) async {
    emit(state.copyWith(dieCuttingCalculation: calculation));
  }

  Future<void> addStitchingCalculation(double calculation) async {
    emit(state.copyWith(stitchingCalculation: calculation));
  }

  Future<void> addConversionCalculation(double calculation) async {
    emit(state.copyWith(conversionCalculation: calculation));
  }

  Future<void> calculate() async {
    var calculation = state.laminationCalculation +
        state.pastingCalculation +
        state.boardCalculation +
        state.stitchingCalculation +
        state.dieCuttingCalculation +
        state.printingCalculation;

    var percentage = (calculation * state.conversionCalculation) / 100;

    final cal = calculation + percentage;
    emit(state.copyWith(
      finalCalculation: cal,
      profitCalculation: percentage,
    ));
  }
}
