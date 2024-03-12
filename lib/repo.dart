// ignore_for_file: avoid_print
import 'package:bloc_and_dio/user_model.dart';
import 'package:dio/dio.dart';

class Repository {
  final dio = Dio();
  Future getUsers() async {
    try {
      Response response = await dio.get("https://reqres.in/api/users?page=2");

      List<dynamic> usersData = response.data['data'];

      // Convert the list of user data into a list of UserModel objects
      List<UserModel> users =
          usersData.map((e) => UserModel.fromJson(e)).toList();

      return users;
    } catch (e) {
      print("catch ---${e.toString()}");
      return [];
    }
  }
}
