class AppConstant {
  final String databaseId = "6350190a8e7ca5486b97";
  final String projectId = "63500c65be7c6bcc9d17";
  final String collectionId = "635019149be78a3a4de9";
  final String userId = "6350194507c3906d6e60";
  final String endpoint = "http://192.168.1.8/v1";
}

class User {
  String name;

  User({required this.name});

  Map<dynamic, dynamic> toJson() {
    return {'name': name};
  }
}
