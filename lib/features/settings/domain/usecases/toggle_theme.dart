import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/settings_repository.dart';

/// Use case for toggling theme
class ToggleTheme implements UseCase<void, NoParams> {
  final SettingsRepository repository;

  ToggleTheme(this.repository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    try {
      await repository.toggleTheme();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to toggle theme'));
    }
  }
}
