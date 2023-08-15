import 'package:bloc/Ui/History/HistoryBloc.dart';
import 'package:bloc/Ui/Home/HomeBloc.dart';
import 'package:bloc/Ui/Topics/TopicsBloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Models/TopicsResponse.dart';
import '../History/HistoryScreen.dart';


class Topics extends StatefulWidget {


  @override
  State<Topics> createState() => _TopicsState();
}

class _TopicsState extends State<Topics> {
  late  TopicsBloc topicsBloc;
 late HistoryBloc hb;
@override
void initState() {
  topicsBloc=TopicsBloc(context);
  hb =HistoryBloc(context);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(icon:Icon(CupertinoIcons.back),onPressed: (){
                  Navigator.pop(context);
                },),
                Expanded(  child: Text("Topics",style:TextStyle(color: Colors.white))),
              ],
            ),
            Flexible(
              child: StreamBuilder(
                stream: topicsBloc.topics.stream,
                builder: (BuildContext context, AsyncSnapshot<List<Topic>> topics) {

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: topics.hasData ? topics.data!.length : 0,
                    itemBuilder: (BuildContext context, int index) {
                      var num=index+1;
                      return GestureDetector(
                        onTap: (){

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => History(topics.data!.elementAt(index).topicID!,topics.data!.elementAt(index).topic.toString()),

                              ));
                        },
                        child: Card(
//

                          elevation: 10,color: Colors.teal,shadowColor: Colors.green[300],
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text(topics.hasData ? "$num ."+ topics.data!.elementAt(index).topic
                                    .toString() : "No Topics Yet ",style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      );
                    }
                    ,
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed:topicsBloc.getTopics(), child: Icon(Icons.refresh_sharp),),
    );
  }
}
