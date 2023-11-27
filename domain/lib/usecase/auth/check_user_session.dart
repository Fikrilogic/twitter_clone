import 'package:core/core.dart';
import 'package:appwrite/models.dart' as models;
import 'package:data/data.dart';
import 'package:injectable/injectable.dart';

@injectable
class CheckUserSession extends FutureUseCase<CheckUserSessionInput, CheckUserSessionOutput>{
  CheckUserSession(this._authRepository);

  final IAuthRepository _authRepository;

  @override
  Future<CheckUserSessionOutput> buildUseCase(CheckUserSessionInput input) async{
    try {
      var res = await _authRepository.checkCurrentUser();

      if(res != null){
        return CheckUserSessionOutput(user: res);
      } else{
        return Future.error('User Not Found');
      }
    } catch(e, st){
      return Future.error(e.toString(), st);
    }
  }

}

class CheckUserSessionInput{

  const CheckUserSessionInput();
}

class CheckUserSessionOutput{
  final models.User user;

  const CheckUserSessionOutput({
    required this.user
});
}