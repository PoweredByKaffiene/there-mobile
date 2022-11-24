import 'dart:async';
import 'package:chopper/chopper.dart';
import 'package:there/model/location_data.dart';
import 'package:there/model/login_result.dart';

import '../model/logout_result.dart';
import '../model/user.dart';

part 'location.chopper.dart';

@ChopperApi(baseUrl: '/locations')
abstract class LocationService extends ChopperService {
  static LocationService create([ChopperClient? client]) => _$LocationService(client);

  @Post(path: '/save')
  Future<Response<LocationData>> save(@Body() Map<String, dynamic> body);
}