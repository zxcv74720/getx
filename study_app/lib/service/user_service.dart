import 'dart:convert';
import '../api/api.dart';
import '../model/user.dart';
import '../model/user_list.dart';


class UserService {
  Api api = Api();

  Future<User?> getUser(int id) async {
    Future.delayed(const Duration(seconds: 5));

    final response = await api.getUser(id);
    final user = User.fromJson(json.decode(response));
    return user;
  }

  Future<UserList?> getUserList(int? cursorId, int? pageSize) async {
    Future.delayed(const Duration(seconds: 5));

    final response = await api.getUserList(cursorId, pageSize);
    final userList = UserList.fromJson(json.decode(response));
    return userList;
  }
}