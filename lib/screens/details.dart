import 'package:animate_do/animate_do.dart';
import 'package:ecomercev2/model/basemodel.dart';
import 'package:ecomercev2/utils/constants.dart';
import 'package:flutter/material.dart';

class detailScreen extends StatefulWidget {
  const detailScreen({super.key, required this.data});
  final ClothModel data;

  @override
  State<detailScreen> createState() => _detailScreenState();
}

class _detailScreenState extends State<detailScreen> {

  getRating(rate){
    Map myrate = {
      1 : Row(children: [FadeInRight(delay: Duration(milliseconds: 100),child: Icon(Icons.star,color: primaryColor,))],),
      2 : Row(children: [FadeInRight(delay: Duration(milliseconds: 100),child: Icon(Icons.star,color: primaryColor,)),FadeInRight(delay: Duration(milliseconds: 300),child: Icon(Icons.star,color: primaryColor,))],),
      3 : Row(children: [FadeInRight(delay: Duration(milliseconds: 100),child: Icon(Icons.star,color: primaryColor,)),FadeInRight(delay: Duration(milliseconds: 300),child: Icon(Icons.star,color: primaryColor,)),FadeInRight(delay: Duration(milliseconds: 500),child: Icon(Icons.star,color: primaryColor,))],),
      4 : Row(children: [FadeInRight(delay: Duration(milliseconds: 100),child: Icon(Icons.star,color: primaryColor,)),FadeInRight(delay: Duration(milliseconds: 300),child: Icon(Icons.star,color: primaryColor,)),FadeInRight(delay: Duration(milliseconds: 500),child: Icon(Icons.star,color: primaryColor,)),FadeInRight(delay: Duration(milliseconds: 700),child: Icon(Icons.star,color: primaryColor,))],),
      5 : Row(children: [FadeInRight(delay: Duration(milliseconds: 100),child: Icon(Icons.star,color: primaryColor,)),FadeInRight(delay: Duration(milliseconds: 300),child: Icon(Icons.star,color: primaryColor,)),FadeInRight(delay: Duration(milliseconds: 500),child: Icon(Icons.star,color: primaryColor,)),FadeInRight(delay: Duration(milliseconds: 700),child: Icon(Icons.star,color: primaryColor,)),FadeInRight(delay: Duration(milliseconds: 900),child: Icon(Icons.star,color: primaryColor,))],)
    };
    return myrate[rate];
  }

  int _sizeSellected = 3;

  @override
  void initState(){
    super.initState();

  }
  

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Icon(Icons.arrow_back_ios),
        ),
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment:  CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: size.width,
                    height: size.height * 0.5,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(widget.data.imgUrl),
                      fit: BoxFit.cover)
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: size.height * 0.08,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: gratians,
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      )
                    ),
                  )
                ]
              ),
              SizedBox(height:  size.height * 0.014,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.data.name, style: theme.headline4,),
                  Text("NGN " + widget.data.price.toString(), style: theme.headline5)
                ],
              ),
              SizedBox(height:  size.height * 0.01,),
              Container(
                child: getRating(widget.data.star)
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.01),
                child: Text("Select size"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
                child: Container(
                  height:  size.height * 0.04,
                  width: size.width,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: sizes.length,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              _sizeSellected = index;
                            });
                          },
                          child: Container(
                            height: size.height * 0.035,
                            width: size.width * 0.13,
                            decoration: BoxDecoration(
                              color: _sizeSellected == index ? primaryColor : Colors.white,
                              border: Border.all(color: primaryColor,),
                              borderRadius: BorderRadius.circular(6),
                            ),

                            child:  Center(child: Text(sizes[index])),
                          ),
                        ),
                      )),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: size.height * 0.01),
                child: Text("Select Color"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
                child: Container(
                  height:  size.height * 0.04,
                  width: size.width,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: colors.length,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.width * 0.022),
                        child: Container(
                          height: size.height * 0.035,
                          width: size.width * 0.13,
                          decoration: BoxDecoration(
                              color: colors[index],
                              border: Border.all(color: primaryColor),
                            borderRadius: BorderRadius.circular(6)
                          ),
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
