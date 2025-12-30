import '../base_data.dart';

class PageData<T> {
  List<T> data;
  int totalPages;
  int totalElements;
  int? activeCount;
  int? inactiveCount;
  bool hasNext;

  PageData(this.data,this.activeCount,this.inactiveCount, this.totalPages, this.totalElements, this.hasNext);

  PageData.fromJson(Map<String, dynamic> json, FromJsonFunction<T> fromJson)
      : data = dataFromJson(json['data'], fromJson),
        totalPages = json['totalPages'],
        activeCount = json['activeCount'],
        inactiveCount = json['inactiveCount'],
        totalElements = json['totalElements'],
        hasNext = json['hasNext'];

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((dynamic e) => e.toJson()).toList(),
      'totalPages': totalPages,
      'activeCount': activeCount,
      'inactiveCount': inactiveCount,
      'totalElements': totalElements,
      'hasNext': hasNext
    };
  }

  @override
  String toString() {
    return 'PageData{data: ${dataToString(data)}, totalPages: $totalPages, totalElements: $totalElements, hasNext: $hasNext}';
  }
}

PageData<T> emptyPageData<T>() => PageData<T>([],0,0, 0, 0, false);

List<T> dataFromJson<T>(List<dynamic> jsonData, FromJsonFunction<T> fromJson) {
  return jsonData.map((e) => fromJson(e)).toList();
}

String dataToString<T>(List<T> data) {
  var res = data.isNotEmpty ? '\n' : '';
  res += data.map((e) => e.toString()).join('\n');
  res += data.isNotEmpty ? '\n' : '';
  return res;
}
