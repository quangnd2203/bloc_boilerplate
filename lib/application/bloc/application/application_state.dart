part of 'application_cubit.dart';

enum ApplicationLoading {
  loading,
  completed,
}

class ApplicationState extends Equatable {
  const ApplicationState({
    this.loading = ApplicationLoading.completed,
    this.connectivityResult = ConnectivityResult.wifi,
  });

  final ApplicationLoading loading;
  final ConnectivityResult connectivityResult;

  ApplicationState copyWith({
    ApplicationLoading? loading,
    ConnectivityResult? connectivityResult
  }) {
    return ApplicationState(
      loading: loading ?? this.loading,
      connectivityResult: connectivityResult ?? this.connectivityResult,
    );
  }

  @override
  List<Object?> get props => <Object?>[
    loading,
    connectivityResult
  ];
}
