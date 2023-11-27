part of 'app_bloc.dart';

abstract class AppState extends Equatable {
  const AppState();
}

class AppInitial extends AppState {
  final bool isLogged;
  final bool loading;

  const AppInitial({this.isLogged = false, this.loading = false});

  @override
  List<Object> get props => [loading, isLogged];

  AppInitial copyWith({
    bool? isLogged,
    bool? loading,
  }) {
    return AppInitial(
      isLogged: isLogged ?? this.isLogged,
      loading: loading ?? this.loading,
    );
  }
}
