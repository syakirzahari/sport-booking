import 'package:get/get.dart';
import 'package:sport_booking/api/api.dart';
import 'package:sport_booking/models/bookingdetail.dart';

class PastBookingController extends GetxController {
  var isLoading = true.obs;
  var pb = <DataBookingDetail>[].obs;

  @override
  void onInit() {
    pastBooking();
    super.onInit();
  }

  void pastBooking() async {
    isLoading(true);
    try {
      var b = await ApiService.getPastBooking();
      pb.value = b;
    } finally {
      isLoading(false);
    }
  }
}
