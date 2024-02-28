part of 'application_cubit.dart';

enum ApplicationLoading {
  loading,
  completed,
}

class ApplicationState extends Equatable {
  const ApplicationState({
    this.loading = ApplicationLoading.completed,
    // this.config,
    // this.states,
  });

  // final ConfigModel? config;
  // final List<StateModel>? states;
  final ApplicationLoading loading;

  ApplicationState copyWith({
    // ConfigModel? config,
    // List<StateModel>? states,
    ApplicationLoading? loading,
  }) {
    return ApplicationState(
      // config: config ?? this.config,
      // states: states ?? this.states,
      loading: loading ?? this.loading,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        loading,
        // config,
        // states,
      ];
}
