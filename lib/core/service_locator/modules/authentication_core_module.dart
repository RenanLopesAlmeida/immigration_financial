import 'package:injectable/injectable.dart';

import '../../repository/remote_authenticate_repository.dart';
import '../../usecase/local_save_current_account_use_case.dart';
import '../../usecase/remote_authenticate_use_case.dart';
import '../../ports/input/local_save_current_account_input_port.dart';
import '../../ports/input/remote_authenticate_input_port.dart';
import '../../ports/output/remote_authenticate_output_port.dart';

@module
abstract class AuthenticationCoreModule {
  @singleton
  RemoteAuthenticateOutputPort remoteAuthenticateOutputPort(
          RemoteAuthenticateRepository repository) =>
      repository;

  @singleton
  RemoteAuthenticateInputPort remoteAuthenticateInputPort(
          RemoteAuthenticateUseCase useCase) =>
      useCase;

  @singleton
  LocalSaveCurrentAccountInputPort localSaveCurrentAccountInputPort(
          LocalSaveCurrentAccountUseCase useCase) =>
      useCase;
}
