part of 'application_cubit.dart';

<<<<<<< HEAD
class ApplicationState extends IApplicationState{

  const ApplicationState({
    super.loading = ApplicationLoading.completed,
    super.connectivityResult = ConnectivityResult.wifi,
  });

  @override
=======
class ApplicationState extends Equatable{

  final ApplicationLoading loading;
  final ConnectivityResult connectivityResult;

  const ApplicationState({
    this.loading = ApplicationLoading.completed,
    this.connectivityResult = ConnectivityResult.wifi,
  });

>>>>>>> migration
  ApplicationState copyWith({
    ApplicationLoading? loading,
    ConnectivityResult? connectivityResult
  }) {
    return ApplicationState(
      loading: loading ?? this.loading,
      connectivityResult: connectivityResult ?? this.connectivityResult,
    );
  }
<<<<<<< HEAD
=======
  
  List<Object?> get props => <Object?>[loading, connectivityResult];
>>>>>>> migration
}
