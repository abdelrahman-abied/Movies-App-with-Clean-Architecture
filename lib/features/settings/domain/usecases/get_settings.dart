import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/settings.dart';
import '../repositories/settings_repository.dart';

/// Use case for getting current settings
class GetSettings implements UseCase<Settings, NoParams> {
  final SettingsRepository repository;

  GetSettings(this.repository);

  @override
  Future<Either<Failure, Settings>> call(NoParams params) async {
    try {
      final settings = await repository.getSettings();
      return Right(settings);
    } catch (e) {
      return Left(ServerFailure('Failed to get settings'));
    }
  }
}
