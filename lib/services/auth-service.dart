import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ecommerce/models/user-model.dart';


class AuthService{

  final FirebaseAuth _auth=FirebaseAuth.instance;


  //Creation d'un User Object à travers Firebase User
  User _userFromFireBaseUser(FirebaseUser user){
      return user!=null?  User(uid:user.uid):null;
  }

   //Stream de Connexion

  Stream<User> get user{
       return _auth.onAuthStateChanged
       .map((FirebaseUser user)=>this._userFromFireBaseUser(user));
       //.map(userFromFireBaseUser);
  }
  //Connexion Annonyme

  Future connexionAnonyme() async{
    try{

           AuthResult result=await _auth.signInAnonymously();
           FirebaseUser user=result.user;
           return this._userFromFireBaseUser(user);

    }catch(e){
          print(e.toString());
          return null;
    }
  }

  //Connexion Email et Password
  Future ConnexionUser (String email,String pwd ) async{
    try{

      AuthResult result=await _auth.signInWithEmailAndPassword(email: email, password: pwd);
      FirebaseUser user=result.user;
      return _userFromFireBaseUser(user);

    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //inscription Email et Password
Future inscriptionUser (String email,String pwd ) async{
  try{

          AuthResult result=await _auth.createUserWithEmailAndPassword(email: email, password: pwd);
          FirebaseUser user=result.user;
          return _userFromFireBaseUser(user);

  }catch(e){
    print(e.toString());
    return null;
  }
}


  //Deconnexion
  Future deconnexion() async{
    try{
     return  await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }

}