import 'package:dazllapp/config/providers/customer_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final roomsprovider = ChangeNotifierProvider(((ref) => CustomerNotifier()));