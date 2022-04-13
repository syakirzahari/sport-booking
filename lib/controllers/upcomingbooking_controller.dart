import 'package:get/get.dart';
import 'package:sport_booking/api/api.dart';
import 'package:sport_booking/models/bookingdetail.dart';

class UpcomingBookingController extends GetxController {
  var isLoading = true.obs;
  var ub = <DataBookingDetail>[].obs;

  @override
  void onInit() {
    upcomingBooking();
    super.onInit();
  }

  void upcomingBooking() async {
    isLoading(true);
    try {
      var b = await ApiService.getUpcomingBooking();
      ub.value = b;
    } finally {
      isLoading(false);
    }
  }
}
