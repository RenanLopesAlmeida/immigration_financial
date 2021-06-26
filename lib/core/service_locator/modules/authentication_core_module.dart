import 'package:injectable/injectable.dart';
import '../../ports/ports.dart';
import '../../usecase/usecase.dart';
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

  @singleton
  LocalSaveCurrentAccountInputPort localSaveCurrentAccountInputPort(
          LocalSaveCurrentAccountUseCase useCase) =>
      useCase;
}
