import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/settings_repository.dart';

/// Use case for updating theme mode
class UpdateTheme implements UseCase<void, ThemeMode> {
  final SettingsRepository repository;

  UpdateTheme(this.repository);

  @override
  Future<Either<Failure, void>> call(ThemeMode themeMode) async {
    try {
      await repository.updateThemeMode(themeMode);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to update theme'));
    }
  }
}
