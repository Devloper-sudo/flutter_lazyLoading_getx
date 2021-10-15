import 'package:dio/dio.dart';
import 'package:getxtutorial/model/lazy_loading_filter.dart';
import 'package:getxtutorial/model/user_model.dart';

import '../constant.dart';

class UserRepository {
  Dio? _dio;

  UserRepository(this._dio);

  Future<List<UserModel>> getUsers(LazyLoadingFilter filter) {
    return _dio!.get('${host}/users', queryParameters: {
      'page': filter.page,
      'limit': filter.limit
    }).then((value) =>
        value.data?.map<UserModel>((u) => UserModel.fromJson(u))?.toList());
  }
}
