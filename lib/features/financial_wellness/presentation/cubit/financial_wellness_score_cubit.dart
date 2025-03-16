import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:kalshi/features/financial_wellness/domain/entities/wellness_score_entity.dart';
import 'package:kalshi/features/financial_wellness/domain/repositories/financial_wellness_repository.dart';

part 'financial_wellness_score_state.dart';

@Injectable()
class FinancialWellnessScoreCubit extends Cubit<FinancialWellnessScoreState> {
  final FinancialWellnessRepository _financialWellnessScoreRepository;

  FinancialWellnessScoreCubit({
    required FinancialWellnessRepository financialWellnessScoreRepository,
  }) : _financialWellnessScoreRepository = financialWellnessScoreRepository,
       super(FinancialWellnessScoreResultState());

  Future<void> getFinancialWellnessScore({
    required double monthlyCosts,
    required double annualIncome,
  }) async {
    emit(FinancialWellnessScoreLoadingState());

    try {
      final result = await _financialWellnessScoreRepository.getWellnessScore(
        monthlyCosts: monthlyCosts,
        annualIncome: annualIncome,
      );

      emit(FinancialWellnessScoreResultState(score: result));
    } catch (e) {
      emit(FinancialWellnessScoreErrorState(failure: e.toString()));
    }
  }
}
