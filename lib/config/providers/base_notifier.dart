import 'package:dazllapp/config/apicall.dart';
import 'package:flutter/widgets.dart';

abstract class BaseNotifier extends ChangeNotifier {
  final DioClient dioClient = DioClient();
}
