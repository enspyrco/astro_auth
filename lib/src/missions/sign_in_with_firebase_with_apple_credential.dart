import 'package:locator_for_perception/locator_for_perception.dart';
import 'package:types_for_perception/core_types.dart';
import 'package:types_for_perception/json_types.dart';
import 'package:types_for_perception/state_types.dart';
import 'package:firebase_auth_service_interface/firebase_auth_service_interface.dart';

class SignInWithFirebaseWithAppleCredential<T extends AstroState>
    extends AwayMission<T> {
  const SignInWithFirebaseWithAppleCredential({
    required this.idToken,
    required this.rawNonce,
  });

  final String idToken;
  final String rawNonce;

  @override
  Future<void> flightPlan(MissionControl<T> missionControl) async {
    final service = locate<FirebaseAuthService>();

    /// We just sign in here, adding the user data to the app state happens where
    /// the "auth state changed" event is handled - in [BindAuthState.flightPlan]
    await service.signInWithApple(idToken: idToken, rawNonce: rawNonce);
  }

  @override
  JsonMap toJson() => {
        'name_': 'Sign In With Firebase',
        'state_': <String, dynamic>{
          'idToken': idToken,
          'rawNonce': rawNonce,
        }
      };
}
