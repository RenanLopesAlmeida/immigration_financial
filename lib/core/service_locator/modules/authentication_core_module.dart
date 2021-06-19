import 'package:injectable/injectable.dart';
import 'package:immigration_financial/core/ports/ports.dart';
import 'package:immigration_financial/core/usecase/usecase.dart';
import '../../repository/repository.dart';

@module
abstract class AuthenticationCoreModule {
  @injectable
  RemoteAuthenticateOutputPort remoteAuthenticateOutputPort(
          RemoteAuthenticateRepository repository) =>
      repository;

  @injectable
  RemoteAuthenticateInputPort remoteAuthenticateInputPort(
          RemoteAuthenticateUseCase useCase) =>
      useCase;
}
