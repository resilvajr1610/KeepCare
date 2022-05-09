import '../Utils/export.dart';

class GoogleSignInProvider extends ChangeNotifier{
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  UserDetails? userDetails;

  GoogleSignInAccount get user=>_user!;

  Future googleLogin() async{
    final googleUser = await googleSignIn.signIn();
    userDetails = UserDetails();

    this.userDetails = new UserDetails(
      id: googleUser?.id,
      displayName: googleUser?.displayName,
      email: googleUser?.email,
      photoUrl: googleUser?.photoUrl
    );

    if(googleUser == null)return;
    _user = googleUser;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken
    );

    await FirebaseAuth.instance.signInWithCredential(credential);

    notifyListeners();
  }

  Future googleLogout() async{
    await googleSignIn.currentUser!=null?await googleSignIn.disconnect():null;
    FirebaseAuth.instance.signOut();
    FacebookAuth.instance.logOut();
    userDetails =null;
    notifyListeners();
  }
}