import 'package:get/get.dart';
import 'package:sport_booking/api/api.dart';
import 'package:sport_booking/models/sportVenue.dart';

class VenueController extends GetxController {
  var isLoading = true.obs;
  var glossary = <DataSport>[].obs;
  int glossaryId = 0;
  @override
  void onInit() {
    fetchFootball();
    super.onInit();
  }

  void fetchFootball() async {
    isLoading(true);
    try {
      var b = await ApiService.getListFootballVenues();
      glossary.value = b;
      update();
    } finally {
      isLoading(false);
    }
  }
}
