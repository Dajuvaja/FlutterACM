import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  AuthService(this._firebaseAuth);
  final FirebaseAuth _firebaseAuth;

  ///signIn
  Future<dynamic> signIn(
      {required String email, required String password}) async {
    String errorMessage = '';
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'invalid-email':
          // errorMessage = "Your email address appears to be malformed.";
          errorMessage = 'Tu correo electrónico parece que está mal escrito.';
          break;
        case 'wrong-password':
          // errorMessage = "Your password is wrong.";
          errorMessage = 'Contraseña incorrecta.';
          break;
        case 'user-not-found':
          // errorMessage = "User with this email doesn't exist.";
          errorMessage =
              'No existe ningún usuario con este correo electrónico.';
          break;
        case 'user-disabled':
          // errorMessage = "User with this email has been disabled.";
          errorMessage =
              'El usuario con este correo electrónico está inhabilitado.';
          break;
        default:
          // errorMessage = "An undefined Error happened.";
          errorMessage =
              'Hubo un error desconocido, por favor intenta de nuevo más tarde.';
      }
    }
    return errorMessage;
  }

  ///signUp can be UserCredential or error string code
  Future<dynamic> signUp(
      {required String email, required String password}) async {
    String errorMessage = '';

    try {
      // Returns an UserCredential
      return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (error) {
      // Returns an error message
      switch (error.code) {
        case 'email-already-in-use':
          errorMessage =
              'Ya hay un usuario registrado con este correo electrónico';
          break;
        case 'invalid-email':
          errorMessage = 'Tu correo electrónico parece que está mal escrito.';
          break;
        case 'weak-password':
          errorMessage = 'La contraseña es muy débil';
          break;
        default:
          errorMessage =
              'Hubo un error desconocido, por favor intenta de nuevo más tarde.';
      }
      return errorMessage;
    }
  }

  ///sendPasswordReset
  Future<String> sendPasswordReset(String email) async {
    String errorMessage = '';
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'invalid-email':
          errorMessage = 'Tu correo electrónico parece que está mal escrito.';
          break;
        case 'user-not-found':
          errorMessage = 'No existe un usuario con este correo electrónico';
          break;
        default:
          errorMessage =
              'Hubo un error desconocido, por favor intenta de nuevo más tarde.';
      }
    }
    return errorMessage;
  }

  ///Change password
  Future<String> changePassword(
    String currentPassword,
    String email,
    String newPassword,
  ) async {
    try {
      final signInStatus =
          await signIn(email: email, password: currentPassword);

      if (signInStatus.isEmpty as bool) {
        final user = _firebaseAuth.currentUser;

        await user!.updatePassword(newPassword);

        return 'success';
      } else {
        return 'error';
      }
    } catch (err) {
      debugPrint(err.toString());
      return 'error';
    }
  }

  ///SignOut
  Future<bool> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  ///Get Currentuser
  User? getCurrentUser() {
    try {
      return _firebaseAuth.currentUser;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}

final AuthService auth = AuthService(FirebaseAuth.instance);
