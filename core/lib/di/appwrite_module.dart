import 'package:injectable/injectable.dart';
import 'package:appwrite/appwrite.dart';
import '../constant/constant.dart';

@module
abstract class AppwriteModule {
  @singleton
  Client get provideAppwriteClient => Client()
      .setEndpoint(AppwriteConstants.url)
      // .setSelfSigned(status: true)
      .setProject(AppwriteConstants.projectId);

  @factoryMethod
  Account provideAccount(Client client) => Account(client);

  @LazySingleton()
  Databases provideDatabase(Client client) => Databases(client);

  @LazySingleton()
  Storage provideStorage(Client client) => Storage(client);

  @LazySingleton()
  Realtime provideRealtime(Client client) => Realtime(client);
}
