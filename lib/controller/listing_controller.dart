import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:getxtutorial/model/lazy_loading_filter.dart';
import 'package:getxtutorial/model/user_model.dart';
import 'package:getxtutorial/service/user_repo.dart';

class ListingController extends GetxController {
  UserRepository? _userRepository;
  final _users = <UserModel>[].obs;
  final _paginationFilter = LazyLoadingFilter().obs;
  final _lastPage = false.obs;

  List<UserModel> get users => _users.toList();

  int get limit => _paginationFilter.value.limit!;

  int get _page => _paginationFilter.value.page!;

  bool get lastPage => _lastPage.value;

  @override
  void onInit() {
    ever(_paginationFilter, (_) => _getAllUsers());
    changePaginationFilter(1, 15);
    super.onInit();
  }

  @override
  void onClose() {}

  @override
  void onReady() {}

  Future<void> _getAllUsers() async {
    final userData = await UserRepository(Dio()).getUsers(_paginationFilter.value);
    print("Sadmasd--$userData");
    if (userData.isEmpty) {
      _lastPage.value = true;
    }
    _users.addAll(userData);
  }

  void changePaginationFilter(int page, int limit) {
    _paginationFilter.update((val) {
      val!.page = page;
      val.limit = limit;
    });
  }

  void changeTotalPerPage(int limitval) {
    _users.clear();
    _lastPage.value = false;
    changePaginationFilter(1, limitval);
  }

  void loadNextPage() => changePaginationFilter(_page + 1, limit);
}
