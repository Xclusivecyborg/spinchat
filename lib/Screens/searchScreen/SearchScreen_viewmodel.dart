import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:spinchat/app/app.locator.dart';
// import 'package:spinchat/app/services/authService.dart';
import 'package:spinchat/app/services/firestore_service.dart';
// import 'package:spinchat/app/services/localdatabase.dart';
import 'package:stacked/stacked.dart';
// import 'package:stacked_services/stacked_services.dart';

class SearchScreenViewmodel extends BaseViewModel {
  // final _navigation = locator<NavigationService>();
  // final _storage = locator<SharedPreferenceLocalStorage>();
  // final _dialog = locator<DialogService>();
  // final _authservice = locator<FirebaseAuthService>();
  // final _snackbar = locator<SnackbarService>();
  final _fireStore = locator<FirestoreService>();
  List<QueryDocumentSnapshot<Map<String, dynamic>>>? snapshot;
  TextEditingController searchResults = new TextEditingController();

  void getUSersByUsername() async {
    await _fireStore
        .getUSersByUsername(username: searchResults.text)!
        .then((value) {
      snapshot = value.docs;
    });
    notifyListeners();
  }

  void getUsers({String? val}) async {
    _fireStore.getUSersByUsername(username: val)!.then((value) {
      snapshot = value.docs;
    });
    notifyListeners();
  }

  // chatRoomCreate(String chatRoomId, data) {
  //   try {
  //     firestore.collection('chatRoom').doc(chatRoomId).set(data);
  //   } on FirebaseException {
  //     throw Failure(message: "could not start a conversation");
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  notifyListeners();
}
