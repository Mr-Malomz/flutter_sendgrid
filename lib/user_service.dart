import 'package:appwrite/appwrite.dart';
import 'package:flutter_sendgrid/utils.dart';

class UserService {
  Client client = Client();
  Databases? db;

  UserService() {
    _init();
  }

  //initialize the application
  _init() async {
    client
        .setEndpoint(AppConstant().endpoint)
        .setProject(AppConstant().projectId);

    db = Databases(client);

    //get current session
    Account account = Account(client);

    try {
      await account.get();
    } on AppwriteException catch (e) {
      if (e.code == 401) {
        account
            .createAnonymousSession()
            .then((value) => value)
            .catchError((e) => e);
      }
    }
  }

  Future updateUser(String name) async {
    try {
      User updateUser = User(name: name);
      var data = await db?.updateDocument(
        databaseId: AppConstant().databaseId,
        collectionId: AppConstant().collectionId,
        documentId: AppConstant().userId,
        data: updateUser.toJson(),
      );
      return data;
    } catch (e) {
      throw Exception('Error updating user');
    }
  }
}
