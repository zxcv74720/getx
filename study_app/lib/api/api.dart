import 'dart:convert';

import 'package:flutter/services.dart';

class Api {
  Future<String> getUser(int id) async {
    final jsonString = await rootBundle.loadString('assets/json/user_data.json');
    final data = json.decode(jsonString) as List;

    final user = data.firstWhere((element) => element['id'] == id);

    return json.encode(user);
  }

  Future<String> getUserList(int? cursorId, int? pageSize) async {
    final jsonString = await rootBundle.loadString('assets/json/user_data.json');
    final data = json.decode(jsonString) as List;

    cursorId ??= 0;
    pageSize ??= 20;

    final start = cursorId;
    final end = start + pageSize;
    final userList = data.sublist(start, end.clamp(0, data.length));

    final nextCursorId = end < (data.length) ? end : -1;

    final response = {
      'data': userList,
      'cursorId': nextCursorId,
    };

    return json.encode(response);
  }

  Future<String> getAirportList(int? cursorId, int? pageSize) async {
    final jsonString = await rootBundle.loadString('assets/json/airport_data.json');
    final data = json.decode(jsonString) as List;

    cursorId ??= 0;
    pageSize ??= 20;

    final start = cursorId;
    final end = start + pageSize;
    final airportList = data.sublist(start, end.clamp(0, data.length));

    final nextCursorId = end < (data.length) ? end : -1;

    final response = {
      'data': airportList,
      'cursorId': nextCursorId,
    };

    return json.encode(response);
  }
}