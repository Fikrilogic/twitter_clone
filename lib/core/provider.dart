import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/constant/constant.dart';

final appwriteClientProvider = Provider((ref) {
  Client client = Client();
  return client
      .setEndpoint(AppwriteConstants.url)
      .setProject(AppwriteConstants.projectId)
      .setSelfSigned(status: true);
});

final appwriteAccountProvider = Provider((ref) {
  return Account(ref.watch(appwriteClientProvider));
});

final appwriteDatabaseProvider = Provider((ref) {
  final database = Databases(ref.watch(appwriteClientProvider));
  return database;
});

final appwriteStorageProvider = Provider((ref) {
  return Storage(ref.watch(appwriteClientProvider));
});

final appwriteRealtimeProvider = Provider((ref) {
  return Realtime(ref.watch(appwriteClientProvider));
});
