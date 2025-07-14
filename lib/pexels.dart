import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';


class pexels extends StatefulWidget {
  const pexels({super.key});

  @override

  State<pexels> createState() => _pexelsState();
}

class _pexelsState extends State<pexels> {
  List images = [];
  int pageno =1;
  @override
  void initState(){
    setState(() {
      fetchAPI();
    });
  }

  fetchAPI()async{
    await http.get(Uri.parse('https://api.pexels.com/v1/curated?per_page=80'),
      headers: {'Authorization' : 'Bmyd8j33DpIypH20CAvsyNMXmIPWhUDShExfldQsUGqgjqFHBgE4oMtR'}
    ).then((value){
      Map result = jsonDecode(value.body);
      setState(() {
        images = result['photos'];
        
      });
    });
  }

  loadingImages()async{
    setState(() {
      pageno+=1;

    });
    await http.get(Uri.parse('https://api.pexels.com/v1/curated?$pageno&per_page=80'),
        headers: {'Authorization' : 'Bmyd8j33DpIypH20CAvsyNMXmIPWhUDShExfldQsUGqgjqFHBgE4oMtR'}
    ).then((value){
      Map result = jsonDecode(value.body);
      setState(() {
        images.addAll(result['photos']);

      });
    });

  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(
                child: GridView.builder(
                  itemCount: images.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                    ),
                    itemBuilder: (context,index){
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                             builder: (context)=>SetWallpaper(
                                ImageLink: images[index]['src']['large2x'],
                            )));
                      },
                      child: Container(
                        child: Image.network(images[index]['src']['tiny'],
                        // fit: BoxFit.cover,
                        //   color: Colors.white,
                        ),
                        color: Colors.white,),
                    );
                    }),
              ),
            ),
            InkWell(
              onTap: (){
                loadingImages();

              },
              child: Container(
                height: 60,
                width: double.infinity,
                color: Colors.pink,
                child: Center(
                  child: Text("Loading More", style: TextStyle(
                    fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white
                  ),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
