
import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:appwrite/models.dart' as models;
import 'package:injectable/injectable.dart';

part 'app_event.dart';
part 'app_state.dart';

@LazySingleton()
class AppBloc extends Bloc<AppEvent, AppInitial> {
  final CheckUserSession checkUserSession;

  AppBloc(this.checkUserSession) : super(const AppInitial()) {
    on<LoadUserSession>(_loadUserSession);
  }

  void _loadUserSession(
      LoadUserSession event, Emitter<AppInitial> emit) async {
    emit(state.copyWith(loading: true));

    try {
      await checkUserSession.buildUseCase(const CheckUserSessionInput());
      emit(state.copyWith(isLogged: true));
    } catch (e) {
      emit(state.copyWith(isLogged: false));
    } finally {
      emit(state.copyWith(loading: false));
    }
  }
}
