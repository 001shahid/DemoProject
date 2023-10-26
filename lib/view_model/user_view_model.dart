import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instragram_clone/respository/user_profile_repository.dart';
import 'package:instragram_clone/utils/utils.dart';

class UserViewModel with ChangeNotifier {
  final _myRepo = UserProfileRepository();
  Future<void> userProfileApi() async {
   debugPrint("in User profile Api");
    _myRepo.getUserProfileApi().then((value) {
     // debugPrint("in User getUserProfileApi");
     // debugPrint(value.toString());

      if (kDebugMode) {}
    }).onError((error, stackTrace) {
      debugPrint("error:-");
      debugPrint(error.toString());
      if (kDebugMode) {}
    });
  }
}
