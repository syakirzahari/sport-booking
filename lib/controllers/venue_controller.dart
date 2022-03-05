import 'package:get/get.dart';
import 'package:sport_booking/api/api.dart';
import 'package:sport_booking/models/sport_venue.dart';

class VenueController extends GetxController {
  var isLoading = true.obs;
  var ven = <DataSport>[].obs;

  @override
  void onInit() {
    fetchVenue();
    super.onInit();
  }

  void fetchVenue() async {
    isLoading(true);
    try {
      var b = await ApiService.getListVenues();
      ven.value = b;
      update();
    } finally {
      isLoading(false);
    }
  }
}
