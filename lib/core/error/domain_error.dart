enum DomainError {
  unexpected,
  invalidCredentials,
  notFound,
}

extension DomainErrorExtension on DomainError {
  String get description {
    switch (this) {
      case DomainError.invalidCredentials:
        return 'Credentials are invalid';

      default:
        return 'Ops! Something unexpected happend. Please try again later!';
    }
  }
}
