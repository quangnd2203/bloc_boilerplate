part of 'application_cubit.dart';

class ApplicationState extends Equatable{

  final ApplicationLoading loading;
  final ConnectivityResult connectivityResult;

  const ApplicationState({
    this.loading = ApplicationLoading.completed,
    this.connectivityResult = ConnectivityResult.wifi,
  });

  ApplicationState copyWith({
    ApplicationLoading? loading,
    ConnectivityResult? connectivityResult
  }) {
    return ApplicationState(
      loading: loading ?? this.loading,
      connectivityResult: connectivityResult ?? this.connectivityResult,
    );
  }
  
  List<Object?> get props => <Object?>[loading, connectivityResult];
}
