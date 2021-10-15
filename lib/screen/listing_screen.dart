import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxtutorial/controller/listing_controller.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class ListingScreen extends StatelessWidget {
  final _controller = Get.find<ListingController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Pagination"),
        ),
        body: Obx(() => LazyLoadScrollView(
              onEndOfPage: _controller.loadNextPage,
              isLoading: _controller.lastPage,
              child: ListView.builder(
                itemCount: _controller.users.length,
                itemBuilder: (context, index) {
                  final user = _controller.users[index];
                  return ListTile(
                    title: Text(user.name!),
                  );
                },
              ),
            )),
      ),
    );
  }
}
