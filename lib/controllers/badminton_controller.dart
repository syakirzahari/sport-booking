import 'package:get/get.dart';
import 'package:sport_booking/api/api.dart';
import 'package:sport_booking/models/sport_venue.dart';

class BadmintonController extends GetxController {
  var isLoading = true.obs;
  var bad = <DataSport>[].obs;

  @override
  void onInit() {
    fetchBadminton();
    super.onInit();
  }

  void fetchBadminton() async {
    isLoading(true);
    try {
      var b = await ApiService.getListBadmintonVenues();
      bad.value = b;
    } finally {
      isLoading(false);
    }
  }
}
