import 'package:flutter/material.dart';
import 'package:news_api/service/remote_service.dart';
import 'model/model.dart';

class Details_page extends StatefulWidget {
  String author;
  String title;
  String description;
  String urlToImage;
  String content;
  Details_page(this.title,this.author,this.description,this.urlToImage,this.content);

  @override
  State<Details_page> createState() => _Details_pageState();
}

class _Details_pageState extends State<Details_page> {

  Post? posts;
  var isLoaded = false;

  @override

  void initState(){
    super.initState();

    getData();
  }

  getData() async {
    posts = await RemoteService().getPost();
    if (posts != null) {
      setState((){
        isLoaded = true;
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
     body: Card(
       margin: EdgeInsets.all(16.0),
       child: Column(
         children: [
           Image.network(widget.urlToImage),
           Align(
             alignment: Alignment.centerLeft,
             child: Container(
               padding: EdgeInsets.only(top: 5,bottom: 5,right: 5,left: 5),
               margin: EdgeInsets.only(top: 15,),
               decoration: BoxDecoration(
                 color: Colors.red,
                 borderRadius: BorderRadius.circular(20),
                 shape: BoxShape.rectangle,
               ),
               child: Text(widget.author,style: TextStyle(
                 color: Colors.white,
                 fontWeight: FontWeight.bold,
                 fontSize: 18,
               ),),
             ),
           ),
           Padding(
             padding: const EdgeInsets.only(right: 20,top: 10,bottom: 10),
             child: Text(widget.description,style: TextStyle(
                 fontSize: 18,fontWeight: FontWeight.bold
             ),),
           )
         ],
       ),
     ),
    );
  }
}
