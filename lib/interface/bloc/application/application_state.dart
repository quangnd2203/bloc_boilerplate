part of 'application_cubit.dart';

abstract class IApplicationState extends Equatable{

  const IApplicationState({
    required this.loading,
    required this.connectivityResult
  });

  final ApplicationLoading loading;
  final ConnectivityResult connectivityResult;

  @override
  IApplicationState copyWith({
    ApplicationLoading? loading,
    ConnectivityResult? connectivityResult
  });

  @override
  List<Object?> get props => <Object?>[
    loading,
    connectivityResult
  ];
}
