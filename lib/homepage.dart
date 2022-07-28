import 'package:flutter/material.dart';
import 'package:news_api/details_page.dart';
import 'package:news_api/model/model.dart';
import 'package:news_api/service/remote_service.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

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
        title: Center(child: Text('News App')),
        backgroundColor: Colors.grey,
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: 10,
            itemBuilder: (context,index){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext context){
                          return Details_page(posts!.articles[index].title, posts!.articles[index].author,
                              posts!.articles[index].description, posts!.articles[index].urlToImage, posts!.articles[index].content);
                        }));
                  },
                  child: Card(
                    margin: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Image.network(posts!.articles[index].urlToImage,),
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
                            child: Text(posts!.articles[index].author,style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(posts!.articles[index].title,style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20,top: 10,bottom: 10),
                          child: Text('Published at:- ' + posts!.articles[index].publishedAt.toString(),style: TextStyle(
                            fontSize: 18,fontWeight: FontWeight.bold
                          ),),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
            }),
      ),
    );
  }
}
