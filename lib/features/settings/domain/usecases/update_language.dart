import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/settings_repository.dart';

/// Use case for updating language
class UpdateLanguage implements UseCase<void, String> {
  final SettingsRepository repository;

  UpdateLanguage(this.repository);

  @override
  Future<Either<Failure, void>> call(String languageCode) async {
    try {
      await repository.updateLanguage(languageCode);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to update language'));
    }
  }
}
