import 'package:flutter/material.dart';



class MenuItem extends StatelessWidget {

   final String menuTitle;
   final Icon menuIcon;
   Function handler;
   bool show;

   MenuItem({
     this.menuTitle,
     this.menuIcon,
     this.handler,
     this.show:false
   });


  @override
  Widget build(BuildContext context) {
    return
    Padding(
      padding: const EdgeInsets.all(0.0),
      child: this.show==false?null:InkWell(
        onTap: (){
          this.handler(context);
        },
        child: ListTile(
          title:Text(this.menuTitle),
          leading: this.menuIcon,

        ),
      ),
    );
  }
}
