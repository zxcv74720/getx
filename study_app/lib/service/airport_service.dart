import 'dart:convert';
import '../api/api.dart';
import '../model/airport_list.dart';

class AirportService {
  Api api = Api();

  Future<AirportList?> getAirportList(int? cursorId, int? pageSize) async {
    Future.delayed(const Duration(seconds: 5));

    final response = await api.getAirportList(cursorId, pageSize);
    final airportList = AirportList.fromJson(json.decode(response));
    return airportList;
  }
}