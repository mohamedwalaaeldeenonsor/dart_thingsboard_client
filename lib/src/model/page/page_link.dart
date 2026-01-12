import 'sort_order.dart';

class PageLink {
  String? textSearch;
  int pageSize;
  int page;
  SortOrder? sortOrder;
  String? deviceProfileId;
  bool? active;

  PageLink(this.pageSize,
      [this.page = 0,
      this.textSearch,
      this.sortOrder,
      this.deviceProfileId,
      this.active]);

  PageLink nextPageLink() {
    return PageLink(
        pageSize, page + 1, textSearch, sortOrder, deviceProfileId, active);
  }

  Map<String, dynamic> toQueryParameters() {
    var queryParameters = <String, dynamic>{'pageSize': pageSize, 'page': page};
    if (textSearch != null && textSearch!.isNotEmpty) {
      queryParameters['textSearch'] = textSearch!;
    }
    if (deviceProfileId != null) {
      queryParameters['deviceProfileId'] = deviceProfileId!;
    }
    if (active != null) {
      queryParameters['active'] = active!;
    }
    if (sortOrder != null) {
      queryParameters['sortProperty'] = sortOrder!.property;
      queryParameters['sortOrder'] = sortOrder!.direction.toShortString();
    }
    return queryParameters;
  }
}

class TimePageLink extends PageLink {
  int? startTime;
  int? endTime;

  TimePageLink(int pageSize,
      [int page = 0,
      String? textSearch,
      SortOrder? sortOrder,
      this.startTime,
      this.endTime])
      : super(pageSize, page, textSearch, sortOrder);

  @override
  TimePageLink nextPageLink() {
    return TimePageLink(
        pageSize, page + 1, textSearch, sortOrder, startTime, endTime);
  }

  @override
  Map<String, dynamic> toQueryParameters() {
    final queryParameters = super.toQueryParameters();
    if (startTime != null) {
      queryParameters['startTime'] = startTime;
    }
    if (endTime != null) {
      queryParameters['endTime'] = endTime;
    }

    return queryParameters;
  }
}
