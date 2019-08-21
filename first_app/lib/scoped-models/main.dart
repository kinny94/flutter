import 'package:first_app/scoped-models/connected_products.dart';

import './products.dart';
import './user.dart';
import 'package:scoped_model/scoped_model.dart';

class MainModel extends Model with UserModel, ProductsModel, ConnectedProducts {}