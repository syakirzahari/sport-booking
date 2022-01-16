import 'package:get/get.dart';
import 'package:sport_booking/api/api.dart';
import 'package:sport_booking/models/sportVenue.dart';

class FutsalController extends GetxController {
  var isLoading = true.obs;
  var fut = <DataSport>[].obs;

  @override
  void onInit() {
    fetchFutsal();
    super.onInit();
  }

  void fetchFutsal() async {
    isLoading(true);
    try {
      var b = await ApiService.getListFutsalVenues();
      fut.value = b;
    } finally {
      isLoading(false);
    }
  }
}
