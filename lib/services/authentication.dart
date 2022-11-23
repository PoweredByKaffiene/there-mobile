import 'dart:async';
import 'package:chopper/chopper.dart';
import 'package:there/model/login_result.dart';

import '../model/user.dart';

part 'authentication.chopper.dart';

@ChopperApi(baseUrl: '/authentication')
abstract class AuthenticationService extends ChopperService {
  static AuthenticationService create([ChopperClient? client]) => _$AuthenticationService(client);

  @Post(path: '/login')
  Future<Response<LoginResult>> login(@Body() Map<String, dynamic> body);

  @Get(path: '/me')
  Future<Response<User>> me();
}