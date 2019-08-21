import 'package:first_app/models/user.dart';
import 'package:first_app/scoped-models/connected_products.dart';
import 'package:scoped_model/scoped_model.dart';

class UserModel extends ConnectedProducts {

  void login(String email, String password) {
    authenticatedUser = User(id: 'fdasdas', email: email, password: password);
  }
}