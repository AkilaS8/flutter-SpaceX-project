
import 'package:firebase_auth/firebase_auth.dart';
import 'package:space_x/features/feature_login/authentication/data/data_source/authentication_firebase_data_source.dart';
import 'package:space_x/features/feature_login/authentication/data/data_source/google_sign_in_data_source.dart';
import 'package:space_x/features/feature_login/authentication/data/models/authentication_detail_model.dart';

class AuthenticationRepository {
  final AuthenticationFirebaseDataSource _authenticationFirebaseProvider;
  final GoogleSignInDataSource _googleSignInProvider;
  AuthenticationRepository(
      {required AuthenticationFirebaseDataSource authenticationFirebaseProvider,
        required GoogleSignInDataSource googleSignInProvider})
      : _googleSignInProvider = googleSignInProvider,
        _authenticationFirebaseProvider = authenticationFirebaseProvider;

  Stream<AuthenticationDetail> getAuthDetailStream() {
    return _authenticationFirebaseProvider.getAuthStates().map((user) {
      return _getAuthCredentialFromFirebaseUser(user: user);
    });
  }

  Future<AuthenticationDetail> authenticateWithGoogle() async {
    User? user = await _authenticationFirebaseProvider.login(
        credential: await _googleSignInProvider.login());
    return _getAuthCredentialFromFirebaseUser(user: user);
  }

  Future<void> unAuthenticate() async {
    await _googleSignInProvider.logout();
    await _authenticationFirebaseProvider.logout();
  }

  AuthenticationDetail _getAuthCredentialFromFirebaseUser(
      {required User? user}) {
    AuthenticationDetail authDetail;
    if (user != null) {
      authDetail = AuthenticationDetail(
        isValid: true,
        uid: user.uid,
        email: user.email,
        photoUrl: user.photoURL,
        name: user.displayName,
      );
    } else {
      authDetail = AuthenticationDetail(isValid: false);
    }
    return authDetail;
  }
}
