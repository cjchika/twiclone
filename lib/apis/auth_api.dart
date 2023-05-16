import 'package:appwrite/appwrite.dart' as model;
import 'package:twiclone/core/core.dart';

abstract class IAuthAPI {
  FutureEither<model.Account> signUp({
    required String email,
    required String password,
})

}
