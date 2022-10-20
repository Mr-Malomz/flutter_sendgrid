class AppConstant {
  final String databaseId = "DATABASE ID HERE";
  final String projectId = "PROEJCT ID HERE";
  final String collectionId = "COLLECTION ID";
  final String userId = "USER ID";
  final String endpoint = "ENDPOINT";
}

class User {
  String name;

  User({required this.name});

  Map<dynamic, dynamic> toJson() {
    return {'name': name};
  }
}
