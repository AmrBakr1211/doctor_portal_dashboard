part of 'bloc.dart';

class GetWaitingListEvents {}

class GetWaitingListEvent extends GetWaitingListEvents {
  final bool withLoading;
  DateTime? date;
  late final String selectedDate;

  GetWaitingListEvent({this.date, this.withLoading = true}) {
    date ??= DateTime.now();
    selectedDate =
        "${date!.year}-${date!.month.toString().padLeft(2, "0")}-${date!.day.toString().padLeft(2, "0")}";
  }
}

// class WaitingListSearchEvent extends GetWaitingListEvents {
//   final String? keyword;
//
//   WaitingListSearchEvent({this.keyword});
// }
