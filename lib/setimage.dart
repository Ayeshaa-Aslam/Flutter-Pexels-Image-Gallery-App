import 'package:flutter/material.dart';
class setimage extends StatefulWidget {
  const setimage({super.key, required this.ImageLink});
  final String ImageLink;
  @override
  State<setimage> createState() => _setimageState();
}

class _setimageState extends State<setimage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(child: Container(
              child: Image.network(widget.ImageLink),
            )),
            InkWell(
              onTap: (){
              },
              child: Container(
                height: 60,
                width: double.infinity,
                color: Colors.pink,
                child: Center(
                  child: Text("Set As Wallpaper", style: TextStyle(
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
