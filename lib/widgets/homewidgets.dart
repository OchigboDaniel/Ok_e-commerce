import 'package:ecomercev2/data/appdata.dart';
import 'package:ecomercev2/model/basemodel.dart';
import 'package:ecomercev2/model/clothCategory.dart';
import 'package:flutter/material.dart';

import '../screens/details.dart';

// display categories
class Categories extends StatelessWidget {
  Categories({super.key, required this.clothCategories});
  ClothCategories clothCategories;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          radius: 35,
          backgroundImage: AssetImage(clothCategories.imgUrl),
        ),
        Text(clothCategories.name,
        style: theme.subtitle1,)
      ],
    );
  }
}

// Display a handful of product
class ShowCase extends StatelessWidget {
  ShowCase({super.key, required this.showCase});
  final ClothModel showCase;


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context).textTheme;
    return Column(
      children: [
        Container(
          width: size.width * 0.6,
          height: size.height * 0.35,
          decoration: BoxDecoration(

            borderRadius: BorderRadius.all(Radius.circular(3)),
            image: DecorationImage(image: AssetImage(showCase.imgUrl),
            fit: BoxFit.cover
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(4, 4),
                color: Colors.black54,
                blurRadius: 4
              )
            ]
          ),
        ),
         Padding(
           padding: const EdgeInsets.only(top: 10),
           child: Text(showCase.name,
           style: theme.subtitle1,),
         ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text("NGN " + showCase.price.toString(),
          style: theme.headline6,),
        )
      ],
    );
  }
}

// Popular Cloths
class PopularCloths extends StatelessWidget {
  PopularCloths({super.key, required this.popularCloths});

  ClothModel popularCloths;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context).textTheme;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            height: size.height * 0.25,
            width: size.width * 0.5,
            decoration: BoxDecoration(
              color: Colors.red,
              boxShadow:[
                BoxShadow(
                offset: Offset(4, 4),
                  blurRadius: 4,
                  color: Colors.black54
              )],
              image: DecorationImage(
                  image: AssetImage(popularCloths.imgUrl),
                  fit: BoxFit.cover),
            ),),
        ),

          Container(
              child: Column(
                children: [
                  Text(popularCloths.name,style: theme.headline4,),
                  Text("NGN " + popularCloths.price.toString(),
                    style: theme.headline3,),
                ],
              )),
        ],
    );
  }
}

