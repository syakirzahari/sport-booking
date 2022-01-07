import 'package:get/get.dart';
import 'package:sport_booking/api/api.dart';
import 'package:sport_booking/models/sportVenue.dart';

class BadmintonController extends GetxController {
  var isLoading = true.obs;
  var glossary = <DataSport>[].obs;
  int glossaryId = 0;
  @override
  void onInit() {
    fetchBadminton();
    super.onInit();
  }

  void fetchBadminton() async {
    isLoading(true);
    try {
      var b = await ApiService.getListBadmintonVenues();
      glossary.value = b;
      update();
    } finally {
      isLoading(false);
    }
  }
}
