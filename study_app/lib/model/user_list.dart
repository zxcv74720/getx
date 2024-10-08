import 'package:study_app/model/user.dart';

class UserList {
  final List<User>? data;
  final int? cursorId;

  UserList({
    this.data,
    this.cursorId,
  });

  factory UserList.fromJson(Map<String, dynamic> json) {
    return UserList(
      data: (json['data'] as List?)?.map((dataJson) => User.fromJson(dataJson)).toList(),
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
    return 'UserList(data: $data, cursorId: $cursorId)';
  }
}