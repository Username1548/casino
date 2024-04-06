abstract class Failure {
  abstract final String message;
}

class UnknowError extends Failure {
  @override
  String get message => 'Unknown error has occurred, try again later';
}

class CashedDataHasNullError extends Failure {
  @override
  String get message => 'Some cashed data has a null';
}

class UnvalidTokenError extends Failure {
  @override
  String get message => 'Token is not valid';
}

class IncorrectUserDataTokenError extends Failure {
  @override
  String get message => 'Incorrect username or password';
}

class UserExistsError extends Failure {
  @override
  String get message => 'User has already existed';
}
