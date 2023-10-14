import 'package:dazllapp/config/providers/base_notifier.dart';

class ServiceProviders extends BaseNotifier {
  int curruntindex = 0;
  List<String> DropsDownvalue = [
    'Realtor',
    'Professional',
    'Customer',
  ];
  String dropdownValue = "Realtor";
  setSevice(int index) {
    curruntindex = index;
    dropdownValue = DropsDownvalue[index];
    notifyListeners();
  }
}
