import 'package:immigration_financial/core/ports/input/remote_fetch_current_user_input_port.dart';
import 'package:immigration_financial/core/usecase/remote_fetch_current_user_use_case.dart';
import 'package:injectable/injectable.dart';

import 'package:immigration_financial/core/ports/output/remote_fetch_current_user_output_port.dart';
import 'package:immigration_financial/core/repository/user_repository.dart';

@module
abstract class UserCoreModule {
  @singleton
  RemoteFetchCurrentUserOutputPort fetchCurrentUserOutputPort(
          UserRepository repository) =>
      repository;

  @singleton
  RemoteFetchCurrentUserInputPort remoteFetchCurrentUserInputPort(
          RemoteFetchCurrentUserUseCase usecase) =>
      usecase;
}
