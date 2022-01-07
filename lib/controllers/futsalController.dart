import 'package:get/get.dart';
import 'package:sport_booking/api/api.dart';
import 'package:sport_booking/models/sportVenue.dart';

class FutsalController extends GetxController {
  var isLoading = true.obs;
  var glossary = <DataSport>[].obs;
  int glossaryId = 0;
  @override
  void onInit() {
    fetchFutsal();
    super.onInit();
  }

  void fetchFutsal() async {
    isLoading(true);
    try {
      var b = await ApiService.getListFutsalVenues();
      glossary.value = b;
      update();
    } finally {
      isLoading(false);
    }
  }
}
