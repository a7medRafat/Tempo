import '../errors/failures.dart';

const String SERVER_FAILURE_MESSAGE = 'please try again later';

const String EMPTY_CACHED_FAILURE_MESSAGE = 'no data';

const String OFLINE_FAILURE_MESSAGE = 'please check your internet connection';

class FailureMessage {
  static String failure(Failures failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return EMPTY_CACHED_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFLINE_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
