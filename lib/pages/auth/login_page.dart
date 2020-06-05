import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/user-model.dart';
import 'package:flutter_ecommerce/pages/auth/inscription-page.dart';
import 'package:flutter_ecommerce/services/auth-service.dart';
import 'package:flutter_ecommerce/shared/loading.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_ecommerce/pages/home/home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool loading=false;
  String error="";
  SharedPreferences preferences;

final AuthService _auth=AuthService();


  @override
  void initState(){
    super.initState();
    //isConnectAnnonyme();
  }

 Future  handleIsConnect() async{

   setState(() {
     loading=true;
   });
     preferences = await SharedPreferences.getInstance();

   User result=await _auth.ConnexionUser(email, pwd);

   if(result==null){
     setState(() {
       error="Email ou Mot de Passe Incorrect";

     });

   }else{
       //

        await preferences.setString("id", result.uid );
        await preferences.setString("login", result.login);
        await preferences.setString("pwd", result.pwd);
        await preferences.setString("adresse", result.adresse);
        await preferences.setString("fullName", result.fullName);
        await preferences.setString("avatar", result.avatar);
        Navigator.pushReplacement(context,
         MaterialPageRoute(
             builder: (context) => new MyHomePage(title: "Kay Djeunde",)
         )
     );
   }

   setState(() {
        loading=false;
   });


  }

/*
  void isConnectAnnonyme() async{
    setState(() {
      loading=true;
    });

   User result=await _auth.connexionAnonyme();

    this.isLogedIn=result!=null;

    if(isLogedIn){
      Fluttertoast.showToast(msg: "Connexion reussie");
      Navigator.pushReplacement(context,
          MaterialPageRoute(
              builder: (context) => new MyHomePage(title: "Kay Djeunde",)
          )
      );
    }else{
      Fluttertoast.showToast(msg: "Erreur de Connexion");
    }



    setState(() {
      loading=false;
    });

  }


 */

  String  email;
  String  pwd;
  //Recuperer de Etat du Formulaire
  final _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return loading? LoadingWidget() :Scaffold(

        appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        //Retour vers la Page Home
        title: InkWell(
        onTap:() {

       },
          child: Text("Page de Connexion"),
       ),
          actions: <Widget>[
            FlatButton.icon(onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => new Inscription()
                  )
              );
            },
                icon: Icon(Icons.person,color: Colors.white,),
                label: Text("Inscription",style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0
                ),)
            )
          ],

    ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        /*child: RaisedButton(
               child: Text("Connexion Annonyme"),
                onPressed: isConnectAnnonyme,
        ),*/
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              TextFormField(
                validator: (value)=>value.isEmpty ? "Entrer le Email":null,
                onChanged: (value){
                  setState(() {
                    email=value;
                  });

                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                validator: (value)=>value.length<6 ? "Le Mot de Passe doit contenir au moins 6 caracteres":null,
                obscureText: true,
                onChanged: (value){
                  setState(() =>pwd=value);
                },
              ),
              SizedBox(height: 20.0,),
              Padding(
                padding: const EdgeInsets.fromLTRB(200.0, 5.0,  0.0, 0.0),
                child: RaisedButton(
                  color:Colors.red[500],
                  onPressed: ()async{
                    if(_formKey.currentState.validate()){
                         await handleIsConnect();
                    }

                  },
                  child: Text("Connexion",
                      style:TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      )),


                ),
              ),
              SizedBox(height: 20.0,),

              Padding(
                padding: const EdgeInsets.all(0.0),
                child: error.isEmpty?null:Text(error,
                    style:TextStyle(
                        color: Colors.red,
                        fontSize: 14.0
                    )
                ),
              )

            ],
          ),
        ),
      ),

    );
  }


}
