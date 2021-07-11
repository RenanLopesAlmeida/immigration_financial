enum DomainError {
  unexpected,
  invalidCredentials,
  notFound,
  emailAlreadyExists,
  unauthorized
}

extension DomainErrorExtension on DomainError {
  String get description {
    switch (this) {
      case DomainError.invalidCredentials:
        return 'Credentials are invalid';

      case DomainError.emailAlreadyExists:
        return 'This account already exists, try to log in';

      default:
        return 'Ops! Something unexpected happend. Please try again later!';
    }
  }
}
