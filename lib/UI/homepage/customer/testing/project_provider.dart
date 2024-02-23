import 'package:dazllapp/config/providers/base_notifier.dart';
import 'package:dazllapp/model/Customer/Rooms.dart';

class ProfileTestProvider extends BaseNotifier {
  bool roomDataLoading = false;
  List<Room> _rooms = [];
  List<Room> get rooms => _rooms;

  void changeRoomDataLoading({required bool value}) {
    roomDataLoading = value;
    notifyListeners();
  }
}
