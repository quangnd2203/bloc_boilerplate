part of 'application_cubit.dart';

class ApplicationState extends IApplicationState{

  const ApplicationState({
    super.loading = ApplicationLoading.completed,
    super.connectivityResult = ConnectivityResult.wifi,
  });

  @override
  ApplicationState copyWith({
    ApplicationLoading? loading,
    ConnectivityResult? connectivityResult
  }) {
    return ApplicationState(
      loading: loading ?? this.loading,
      connectivityResult: connectivityResult ?? this.connectivityResult,
    );
  }
}
