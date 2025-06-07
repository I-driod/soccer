import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

class AuthApiService {
  var logger = Logger();

  Future<UserCredential> login(String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      // Re-throw the exception to be handled at a higher level
      throw e.code;
    } catch (e) {
      // Re-throw any other exceptions
      throw e.toString();
    }
  }

  // Future<List<Team>> fetchTeams() async {
  //   final querySnapshot = await FirebaseFirestore.instance
  //       .collection('teams')
  //       .get();
  //
  //   try {
  //     return querySnapshot.docs.map((doc) => Team.fromMap(doc.data())).toList();
  //   } on FirebaseException catch (e) {
  //     // Re-throw the exception to be handled at a higher level
  //     throw e.code;
  //   } catch (e) {
  //     // Re-throw any other exceptions
  //     throw e.toString();
  //   }
  // }
}
