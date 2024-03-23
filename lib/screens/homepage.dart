import 'package:ecomercev2/data/appdata.dart';
import 'package:ecomercev2/model/basemodel.dart';
import 'package:ecomercev2/model/clothCategory.dart';
import 'package:ecomercev2/screens/details.dart';
import 'package:ecomercev2/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import '../widgets/homewidgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late PageController _controller;

  @override
  void initState(){
    super.initState;
    _controller = PageController(
      initialPage: 1,
      viewportFraction: 0.7,
    ) ;
  }

  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery.of(context).size;
    var theme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: screenSize.width,
          //height: screenSize.height,
          child:SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Two Texts
                FadeIn(
                  delay: Duration(milliseconds: 400),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            text: TextSpan(
                              text: 'Dealer of Okirica Clothes, ',
                              style: theme.headline2,
                              children: [
                                TextSpan(
                                  text: 'Slay on a Budget',
                                  style: theme.headline2?.copyWith(
                                    color: primaryColor
                                  )
                                )
                              ]
                            )),

                        RichText(
                            text: TextSpan(
                                text: 'Lagos, ',
                                style: theme.headline2?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                                children: [
                                  TextSpan(
                                      text: 'Nigeria',
                                      style: theme.headline2?.copyWith(
                                          color: primaryColor,
                                          fontWeight: FontWeight.w600
                                      )
                                  )
                                ]
                            ))
                      ],
                    ),
                  ),
                ),

                // Cloth Categories
                FadeIn(
                  delay: Duration(milliseconds: 45),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Container(
                      width: screenSize.width,
                      height: screenSize.height * 0.13,
                      child: ListView.separated(

                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index){
                            ClothCategories category = categories[index];
                            return Categories(
                                clothCategories: category);
                          },
                          separatorBuilder: (context, index) => SizedBox(width: screenSize.width * 0.03,),
                          itemCount: 5,
                    )),
                  ),
                ),

                // Showcasing a handful of products
                FadeIn(
                  delay: Duration(milliseconds: 500),
                  child: Container(
                    width: screenSize.width,
                    height: screenSize.height * 0.45,
                    child: PageView.builder(
                        controller: _controller,
                        itemCount: showCaseList.length,
                        itemBuilder: (context, index){
                          ClothModel showcase = showCaseList[index];
                          return GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)
                                => detailScreen(data: showcase)));
                              },
                              child: ShowCase(showCase: showcase));
                        }
                  )),
                ),

                // Popular Products
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('As e dey hot e dey burn',
                      style: theme.headline5,),
                      Text('See all',
                      style: theme.headline4?.copyWith(
                        color: Colors.blue
                      ),)
                    ],
                  ),
                ),
               Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    width: screenSize.width,
                    height: screenSize.height * 0.4,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: screenSize.width * 0.01,
                          mainAxisSpacing: screenSize.width * 0.025,
                          mainAxisExtent: screenSize.height * 0.315),
                      itemCount: 5,
                        itemBuilder: (ctx, index) {
                        ClothModel popularCloths = showCaseList[index];
                          return Container(
                            child: PopularCloths(popularCloths: popularCloths),
                          );
                        }),

                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
