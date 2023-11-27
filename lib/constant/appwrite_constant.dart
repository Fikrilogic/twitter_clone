class AppwriteConstants{
  static const String databaseId = "6543a07923b43b728ca1";
  static const String projectId = "6543a0384e94cc9608a4";
  static const String bucketId = "6550d7f56b61d58a88e2";
  static const String url = "https://cloud.appwrite.io/v1";


  static const String userCollection = "6547970edf49e47bf2ee";
  static const String tweetCollection = "6550e048ca62360a7986";

  static String imageUrl(String imageId) =>
      '$url/storage/bucket/$bucketId/files/$imageId/view?project=$projectId&mode=admin';
}