import 'package:flutter/material.dart';
import 'package:news_api/model.dart';
import 'package:news_api/remote_service.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  List<Post>? posts;
  var isLoaded = false;

  @override

  void initState(){
    super.initState();

    getData();
  }

  getData() async {
    posts = await RemoteService().getArticles();
    if (posts != null) {
      setState((){
        isLoaded = true;
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
        backgroundColor: Colors.grey,
      ),
      body: ListView.builder(
        itemCount: posts?.length,
          itemBuilder: (context,index){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: Column(
                  children: [
                    Text(posts![index].articles[index].title),
                  ],
                ),
              )
            ],
          );
          }),
    );
  }
}
