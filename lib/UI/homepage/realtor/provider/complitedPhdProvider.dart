import 'package:dazllapp/config/providers/base_notifier.dart';
import 'package:dazllapp/config/providers/providers.dart';
import 'package:dazllapp/model/Realtor/filterProject.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum Loading { loding, complited }

class ComplitedPhdProvider extends BaseNotifier {
  Loading _loading = Loading.loding;
  Loading get loading => _loading;
  FilterProject? _selectedCustomer;
  FilterProject? get selectedCustomer => _selectedCustomer;
  List<FilterProject> listOfFilterProject = [];
  Future loadCustomer({required WidgetRef ref}) async {
    _loading = Loading.loding;
    _selectedCustomer == null;
    listOfFilterProject = await ref.read(realtorprovider).filterProject();
  }

  Future loadComplitedPhd({required WidgetRef ref}) async {
    _loading = Loading.loding;
    await ref
        .read(realtorprovider)
        .getSingleComplitedPhd(id: _selectedCustomer!.id.toString());
    _loading = Loading.complited;
    notifyListeners();
  }

  loader(Loading load) {
    _loading = load;
    // notifyListeners();
  }

  selectCustomer(FilterProject cus) {
    _selectedCustomer = cus;

    notifyListeners();
  }
}
