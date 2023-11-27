
import 'package:appwrite/appwrite.dart';
import 'package:data/repository/auth/auth_repository.dart';
import 'package:data/repository/storage/storage_repository.dart';
import 'package:data/repository/tweet/tweet_repository.dart';
import 'package:data/repository/user/user_repository.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RepositoryModule{
  IAuthRepository provideAuthApi(Account account) => AuthRepositoryImpl(account: account);
  IStorageRepository provideStorageApi(Storage storage) => StorageRepositoryImpl(storage: storage);
  ITweetRepository provideTweetRepository(Databases db, Realtime realtime) => TweetRepositoryImpl(db: db, realtime: realtime);
  IUserRepository provideUserRepository(Databases db) => UserRepositoryImpl(db: db);
}