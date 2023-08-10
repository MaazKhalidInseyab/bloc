import 'package:bloc/Models/loginResponse.dart';
import 'package:bloc/Ui/Profile/ProfileBloc.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileBloc bloc;


  @override
  void initState() {
    bloc = ProfileBloc(context);
    bloc.getProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StreamBuilder(
          stream: bloc.profile.stream,
          builder: (BuildContext context, AsyncSnapshot<PayLoad> snapshot) {
            return Card(
              elevation: 20,
                color: Colors.lightBlue,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(

                    children: [
                      Row(children: [
                        Text("Name: ", style: TextStyle(color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),),
                        Text(snapshot.hasData? snapshot.data!.fullName.toString():"No Data",style: TextStyle(color: Colors.white70,
                          fontSize: 20,),)
                      ],),
                      Row(children: [
                        Text("Email: ", style: TextStyle(color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),),
                        Text(snapshot.hasData? snapshot.data!.email.toString():"abc@123.com",style: TextStyle(color: Colors.white70,
                          fontSize: 20,),),
                      ],),
                      Row(children: [
                        Text("Gpt user Id: ", style: TextStyle(color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),),
                        Text(snapshot.hasData? snapshot.data!.gptUserId.toString():"00",style: TextStyle(color: Colors.white70,
                          fontSize: 20,),),
                      ],),
                      Row(children: [
                        Text("Phone: ", style: TextStyle(color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),),
                        Text(snapshot.hasData? snapshot.data!.phoneNumber.toString():"xxxx-xxxxxxx",style: TextStyle(color: Colors.white70,
                          fontSize: 20,),),
                      ],),
                      Row(children: [
                        Text("Package: ", style: TextStyle(color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),),
                        Text(snapshot.hasData? snapshot.data!.packageName.toString():"Package",style: TextStyle(color: Colors.white70,
                          fontSize: 20,),),
                      ],),
                    ],
                  ),
                )
            );

          },
        ),
      ],
    ),
    );
  }
}
