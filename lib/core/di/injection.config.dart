// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/financial_wellness/data/repositories/financial_wellness_repository_impl.dart'
    as _i522;
import '../../features/financial_wellness/data/services/financial_wellness_service_impl.dart'
    as _i129;
import '../../features/financial_wellness/domain/repositories/financial_wellness_repository.dart'
    as _i367;
import '../../features/financial_wellness/domain/services/financial_wellness_service.dart'
    as _i852;
import '../../features/financial_wellness/presentation/cubit/financial_wellness_score_cubit.dart'
    as _i510;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i852.FinancialWellnessService>(
      () => _i129.FinancialWellnessServiceImpl(),
    );
    gh.factory<_i367.FinancialWellnessRepository>(
      () => _i522.FinancialWellnessRepositoryImpl(
        service: gh<_i852.FinancialWellnessService>(),
      ),
    );
    gh.factory<_i510.FinancialWellnessScoreCubit>(
      () => _i510.FinancialWellnessScoreCubit(
        financialWellnessScoreRepository:
            gh<_i367.FinancialWellnessRepository>(),
      ),
    );
    return this;
  }
}
