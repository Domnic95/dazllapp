import 'package:dazllapp/config/providers/customer_notifier.dart';
import 'package:dazllapp/config/providers/professional_notifier.dart';
import 'package:dazllapp/config/providers/realtor_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final customernotifier = ChangeNotifierProvider(((ref) => CustomerNotifier()));
final professionaltifier =
    ChangeNotifierProvider(((ref) => ProfessionalNotifier()));
final realtorprovider =
    ChangeNotifierProvider(((ref) => realtorNotifier()));
