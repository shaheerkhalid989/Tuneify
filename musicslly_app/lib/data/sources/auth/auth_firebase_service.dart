import "package:cloud_firestore/cloud_firestore.dart";
import "package:dartz/dartz.dart";
import "package:firebase_auth/firebase_auth.dart" as firebase_auth;
import "package:musicslly_app/data/models/auth/create_user_req.dart";
import "package:musicslly_app/data/models/auth/signin_user_req.dart";

abstract class AuthFirebaseService {
  Future<Either> signIN(SigninUserReq signinUserReq);
  Future<Either> signUP(CreateUserReq createUserReq);
  // Future<void> logout();
  // Future<void> register(String email, String password);
  // Future<bool> isLogged();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;

  @override
  Future<Either> signIN(SigninUserReq signinUserReq) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: signinUserReq.email, password: signinUserReq.password);
      return Right('Sign In was Successful');
    } on firebase_auth.FirebaseAuthException catch (e) {
      String message = "";

      switch (e.code) {
        case "user-not-found":
          message = "No user found for that email.";
          break;
        case "invalid-password":
          message = "Wrong password provided for that user.";
          break;
        case "invalid-credential":
          message = "Entered credentails are wrong.";
          break;
        case "too-many-requests":
          message = "Too many requests. Try again later.";
          break;
        case "invalid-email":
          message = "Invalid email.";
          break;
        case "channel-error":
          message = "All fields are required!";
          break;
        default:
          message = "An error occurred";
      }

      return Left(message);
    }
  }

  @override
  Future<Either> signUP(CreateUserReq createUserReq) async {
    try {
      var data = await firebaseAuth.createUserWithEmailAndPassword(
          email: createUserReq.email, password: createUserReq.password);

      FirebaseFirestore.instance.collection("Users").add({
        "name": createUserReq.name,
        "email": data.user?.email,
      });
      return Right('Sign Up was Successful');
    } on firebase_auth.FirebaseAuthException catch (e) {
      String message = "";

      switch (e.code) {
        case "email-already-in-use":
          message = "Email already in use";
          break;
        case "invalid-email":
          message = "Invalid email";
          break;
        case "operation-not-allowed":
          message = "Operation not allowed";
          break;
        case "weak-password":
          message = "Weak password";
          break;
        case "too-many-requests":
          message = "Too many requests. Try again later.";
          break;
        case "channel-error":
          message = "All fields are required!";
          break;
        default:
          message = "An error occurred";
      }
      return Left(message);
    }
  }
}
