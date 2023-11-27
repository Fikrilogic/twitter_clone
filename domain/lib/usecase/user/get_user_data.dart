import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUserData extends FutureUseCase<GetUserDataInput, GetUserDataOutput> {
  final IAuthRepository authRepository;
  final IUserRepository userRepository;

  GetUserData(this.authRepository, this.userRepository);

  @override
  Future<GetUserDataOutput> buildUseCase(GetUserDataInput input) async {
    var userSession = await authRepository.checkCurrentUser();
    if (userSession != null) {
      var res = await userRepository.getUserData(userSession.$id);

      var user = UserModel.fromMap(res.data);

      return GetUserDataOutput(
        user: user
      );
    } else {
      return GetUserDataOutput(
          user: null
      );
    }
  }
}

class GetUserDataInput {

  const GetUserDataInput();
}

class GetUserDataOutput {
  final UserModel? user;

  GetUserDataOutput({this.user});
}
