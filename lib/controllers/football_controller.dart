import 'package:get/get.dart';
import 'package:sport_booking/api/api.dart';
import 'package:sport_booking/models/sport_venue.dart';

class FootballController extends GetxController {
  var isLoading = true.obs;
  var fot = <DataSport>[].obs;

  @override
  void onInit() {
    fetchFootball();
    super.onInit();
  }

  void fetchFootball() async {
    isLoading(true);
    try {
      var b = await ApiService.getListFootballVenues();
      fot.value = b;
    } finally {
      isLoading(false);
    }
  }
}
