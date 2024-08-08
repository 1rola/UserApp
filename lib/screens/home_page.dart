// ignore_for_file: prefer_const_constructors, use_super_parameters

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:users_app/models/users.dart';
import 'package:users_app/provider/user_provider.dart';
import 'package:users_app/widgets/user_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 209, 24, 135),
        title: Text(
          "Users",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: userProvider.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : userProvider.errorMessage != null
                ? Center(
                    child: Text(
                      userProvider.errorMessage!,
                    ),
                  )
                : ListView.builder(
                    itemCount: userProvider.users.length,
                    itemBuilder: (context, index) {
                      Users user = userProvider.users[index];
                      int n = Random().nextInt(8) + 1;
                      return User_card(
                        imagePath: "assets/images/$n.png",
                        user: user,
                      );
                    }),
      ),
    );
  }
}
