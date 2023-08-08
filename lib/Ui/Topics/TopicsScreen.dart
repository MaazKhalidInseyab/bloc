import 'package:bloc/Ui/Topics/TopicsBloc.dart';
import 'package:flutter/material.dart';
import '../../Models/TopicsResponse.dart';


class Topics extends StatefulWidget {


  @override
  State<Topics> createState() => _TopicsState();
}

class _TopicsState extends State<Topics> {
  late  TopicsBloc topicsBloc;

@override
void initState() {
  topicsBloc=TopicsBloc(context);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Topicss"),
              ),
            ),
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
                    return Card(


                      elevation: 10,color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(topics.hasData ? "$num ."+ topics.data!.elementAt(index).topic
                                .toString() : "No Topics Yet "),
                      ),
                    );
                  },);
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed:topicsBloc.getTopics(), child: Icon(Icons.refresh_sharp),),
    );
  }
}