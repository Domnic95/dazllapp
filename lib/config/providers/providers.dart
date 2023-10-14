import 'package:dazllapp/UI/home/provider/service_provider.dart';
import 'package:dazllapp/UI/homepage/customer/provider/roomsProvider.dart';
import 'package:dazllapp/UI/homepage/realtor/provider/complitedPhdProvider.dart';
import 'package:dazllapp/UI/homepage/realtor/provider/phdProvider.dart';
import 'package:dazllapp/UI/homepage/realtor/provider/roomsProvider.dart';
import 'package:dazllapp/config/providers/customer_notifier.dart';
import 'package:dazllapp/config/providers/professional_notifier.dart';
import 'package:dazllapp/config/providers/realtor_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final customernotifier = ChangeNotifierProvider(((ref) => CustomerNotifier()));
final professionaltifier =
    ChangeNotifierProvider(((ref) => ProfessionalNotifier()));
final realtorprovider = ChangeNotifierProvider(((ref) => RealtorNotifier()));
final customerRoomsProvider = ChangeNotifierProvider(((ref) => RoomProvider()));
final realtorRoomsProvider = ChangeNotifierProvider(((ref) => RealtorRoomProvider()));
final phdProvider = ChangeNotifierProvider(((ref) => PhdProvider()));
final complitedPhdProvider = ChangeNotifierProvider(((ref) => ComplitedPhdProvider()));
final serviceProviders = ChangeNotifierProvider(((ref) => ServiceProviders()));
