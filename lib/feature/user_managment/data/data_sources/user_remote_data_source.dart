import 'package:casino/core/constants/constants.dart';
import 'package:dio/dio.dart';

class UserRemoteDataSource {
  final Dio dio;

  UserRemoteDataSource({required this.dio});

  Future<Response<dynamic>> signIn(
      String username, String password, String token) async {
    final tokenResponse = await dio
        .post('${baseAuthURL}is_token_valid', data: {'acces_token': token});
    if (tokenResponse.statusCode == 422) {
      return generateToken(username, password);
    } else {
      return tokenResponse;
    }
  }

  Future<Response<dynamic>> generateToken(String username, String password) async{
    final response = await dio.post('${baseAuthURL}generate_token',
        data: {'username': username, 'password': password});
    return response;
  }

  Future<Response<dynamic>> signUp(String username, String password) async{
    final response = await dio.post('${baseAuthURL}register',
        data: {'username': username, 'password': password});
    return response;
  }
}
