import 'package:appwrite/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:appwrite/models.dart' as models;
import 'package:twitter_clone/api/auth_api.dart';
import 'package:twitter_clone/api/user_api.dart';
import 'package:twitter_clone/core/core.dart';
import 'package:twitter_clone/feature/auth/view/login_view.dart';
import 'package:twitter_clone/feature/home/view/home_view.dart';
import 'package:twitter_clone/model/user_model.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(
      authApi: ref.watch(authApiProvider), userApi: ref.watch(userApiProvider));
});

final currentUserDetailProvider = FutureProvider((ref) {
  final currentUserId = ref.watch(currentUserAccountProvider).value!.$id;
  final userDetail = ref.watch(userDetailProvider(currentUserId));
  return userDetail.value;
});

final userDetailProvider = FutureProvider.family((ref, String uid) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.getUserData(uid);
});

final currentUserAccountProvider = FutureProvider((ref) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.checkCurrentUser();
});

class AuthController extends StateNotifier<bool> {
  final AuthApiImpl _authApi;
  final UserApi _userApi;

  AuthController({required AuthApiImpl authApi, required UserApi userApi})
      : _authApi = authApi,
        _userApi = userApi,
        super(false);

  Future<models.User?> checkCurrentUser() => _authApi.checkCurrentUser();

  void signUp({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true;
    final response = await _authApi.signUp(email: email, password: password);
    state = false;
    response.fold(
      (l) => showSnackbar(context, l.message),
      (r) async {
        UserModel userModel = UserModel(
            email: email,
            name: getNameFromEmail(email),
            profilePic: '',
            bannerPic: '',
            uid: r.$id,
            bio: '',
            isTwitterBlue: false,
            followers: const [],
            following: const []);
        final res = await _userApi.saveUserData(userModel);
        res.fold((l) => showSnackbar(context, l.message), (r) {
          showSnackbar(context, "Signup Success, Please Login!!");
          Navigator.push(context, LoginView.route());
        });
      },
    );
  }

  void login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true;
    final response = await _authApi.login(email: email, password: password);
    state = false;
    response.fold(
      (l) => showSnackbar(context, l.message),
      (r) => Navigator.push(context, HomeView.route()),
    );
  }

  Future<UserModel> getUserData(String uid) async {
    try {
      final document = await _userApi.getUserData(uid);

      print('document $document');
      final updateUser = UserModel.fromMap(document.data);
      print('document $updateUser');
      return updateUser;
    } catch (e, st) {
      print(e.toString());
      rethrow;
    }
  }
}
