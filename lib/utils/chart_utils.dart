import 'package:weight_tracker/data/models/weight.dart';

class LineCharUtils {
  final List<String> months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];

  int calculateInterval(List<Weight> weighList, int numMonths) {
    int startingMonth = weighList.isNotEmpty ? weighList[0].time.month : 1;
    int currMonth = startingMonth;
    int interval = 0;

    for (int i = 0; i < weighList.length; i++) {
      int pastMonth = weighList[i].time.month;
      if (currMonth == pastMonth &&
          i - 1 >= 0 &&
          pastMonth != weighList[i - 1].time.month) break;
      if (currMonth - pastMonth > numMonths) {
        break;
      }
      if (currMonth - pastMonth < 0 && currMonth - pastMonth + 12 > numMonths) {
        break;
      }

      interval++;
    }

    return interval;
  }
}
