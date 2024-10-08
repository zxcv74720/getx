import 'package:study_app/model/airport.dart';

class AirportList {
  final List<Airport>? data;
  final int? cursorId;

  AirportList({
    this.data,
    this.cursorId,
  });

  factory AirportList.fromJson(Map<String, dynamic> json) {
    return AirportList(
      data: (json['data'] as List?)?.map((dataJson) => Airport.fromJson(dataJson)).toList(),
      cursorId: json['cursorId'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (data != null) 'data': data?.map((data) => data.toJson()).toList(),
      if (cursorId != null) 'cursorId': cursorId,
    };
  }

  @override
  String toString() {
    return 'AirportList(data: $data, cursorId: $cursorId)';
  }
}