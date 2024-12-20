import 'package:rxdart/rxdart.dart';

import '/backend/schema/structs/index.dart';
import 'custom_auth_manager.dart';

class StaffCanvasAuthUser {
  StaffCanvasAuthUser({
    required this.loggedIn,
    this.uid,
    this.userData,
  });

  bool loggedIn;
  String? uid;
  UserStruct? userData;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<StaffCanvasAuthUser> staffCanvasAuthUserSubject =
    BehaviorSubject.seeded(StaffCanvasAuthUser(loggedIn: false));
Stream<StaffCanvasAuthUser> staffCanvasAuthUserStream() =>
    staffCanvasAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
