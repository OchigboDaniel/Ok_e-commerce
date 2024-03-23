import 'package:ecomercev2/utils/constants.dart';
import 'package:flutter/material.dart';

import '../data/appdata.dart';
import '../model/basemodel.dart';
import '../widgets/homewidgets.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  late TextEditingController _controller;

  @override
  void initState(){
    super.initState();
    _controller = TextEditingController();

    searchList = showCaseList;
  }


  void searchFunc( String search){
    setState(() {
      searchList = showCaseList.where((product) => product.name.toLowerCase().contains(search)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context).textTheme;
    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              onChanged: (value){searchFunc(value);},
              decoration: InputDecoration(
                hintText: 'Search your thrift',
                contentPadding: EdgeInsets.all(10),
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  onPressed: (){
                    setState(() {
                      _controller.clear();
                    });
                  },
                  icon: Icon(Icons.clear),
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Frequent Search', style: theme.headline5?.copyWith(color: primaryColor)),
                  Container(
                    width: size.width,
                    height: size.height,
                    child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: searchList.length  ,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, mainAxisExtent: size.height * 0.315),
                      itemBuilder: (context, index){
                        ClothModel popularCloth = searchList[index];
                        return Stack(
                          alignment: Alignment.topRight,
                            children: [
                              PopularCloths(popularCloths: popularCloth),
                              Container(
                                decoration:BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric( vertical: 2.5),
                                  child: IconButton(
                                    onPressed: (){},
                                    icon: Icon(Icons.shopping_bag_outlined, color: Colors.white)),
                                ),
                              )]);
                      }),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
