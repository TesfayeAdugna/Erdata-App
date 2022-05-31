
abstract class LogoutState{
  const LogoutState();
}
class Idle extends LogoutState {}

class LogoutOperationSuccess extends LogoutState {

  const LogoutOperationSuccess();
}

class LogoutOperationFailure extends LogoutState {
  final Object error;

  const LogoutOperationFailure(this.error);
}