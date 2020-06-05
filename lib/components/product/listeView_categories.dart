import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/categorie-model.dart';
import 'package:flutter_ecommerce/services/categorie-service.dart';




class ListCategorieProduct extends StatefulWidget {
  @override
  _ListCategorieProductState createState() => _ListCategorieProductState();


}

class _ListCategorieProductState extends State<ListCategorieProduct> {

  final CategorieService service=new CategorieService();

  Widget createCategoriesListView(BuildContext context, AsyncSnapshot snapshot) {
    var values = snapshot.data;

   return  ListView.builder(
        scrollDirection:Axis.horizontal ,
         itemCount: values == null ? 0 : values.length ,
        itemBuilder: (context,index){
          return values.isNotEmpty? Categorie(
            image_location: values[index].image_location ,
            image_caption: values[index].image_caption,
          ):CircularProgressIndicator();

        }
    );

  }


  List<Category> categories=[
      new Category(
        image_location: 'images/cats/formal.png' ,
        image_caption: "TShirt",),
      new Category(
            image_location: 'images/cats/tshirt.png' ,
            image_caption: "TShirt",)
  ];


  void initData() {
    setState(()  {

    });
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();


  }



  @override
  Widget build(BuildContext context) {

    return Container(
      height: 100.0,
      child: FutureBuilder(
          future: service.categories(),
          initialData: [
            new Category(
              image_location: 'images/cats/formal.png' ,
              image_caption: "TShirt",),
            new Category(
              image_location: 'images/cats/tshirt.png' ,
              image_caption: "TShirt",)
          ],
          builder: (context, snapshot) {
            if (snapshot.hasData) {

              return createCategoriesListView(context, snapshot);

            }
            return CircularProgressIndicator();

          }
          ),
    );

     /* ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[

            new  Categorie(
              image_location: 'images/cats/tshirt.png' ,
              image_caption: "TShirt",
            ),

            /* new Categorie(
                  image_location: 'images/cats/dress.png' ,
                  image_caption: "Robes",
                ),
                new Categorie(
                  image_location: 'images/cats/formal.png' ,
                  image_caption: "Vestes ",
                ),

                new   Categorie(
                  image_location: 'images/cats/informal.png' ,
                  image_caption: "Blouson",
                ),

                Categorie(
                  image_location: 'images/cats/jeans.png' ,
                  image_caption: "Jeans",
                ),
                Categorie(
                  image_location: 'images/cats/shoe.png' ,
                  image_caption: "Chaussures",
                )
                , Categorie(
                  image_location: 'images/cats/accessories.png' ,
                  image_caption: "Accessoires",
                )*/





          ],
        ),*/




  }
}











class Categorie extends StatelessWidget {
  final String image_location;
    String image_caption;
  Categorie({
    this.image_location,
    this.image_caption
});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0) ,
      child: InkWell(
        onTap:(){},
        child: Container(
          width: 100.0,
          child: ListTile(
            title:Image.asset(image_location,width: 100.0,height: 80.0),
            subtitle:Container(
              alignment: Alignment.topCenter,
              child:Text(image_caption,style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold

              ),),
            )
      ),
        ),),

    );
  }
}

