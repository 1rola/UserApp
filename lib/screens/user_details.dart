// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, unnecessary_string_interpolations, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:users_app/models/users.dart';
import 'package:users_app/widgets/info_card.dart';
import 'package:users_app/widgets/text_card.dart';

class UserDetails extends StatelessWidget {
  final Users user;
  final String imagePath;
  UserDetails({required this.user, required this.imagePath, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 209, 24, 135),
        centerTitle: true,
        title: Text('ID #${user.id}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    imagePath,
                    width: 90,
                    height: 90,
                  ),
                ),
                Text(
                  '${user.name}',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  '@${user.username}',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                InfoCard(
                  title: 'email',
                  description: user.email,
                  icon: Icons.email,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextCard(
                      text: 'street',
                      subtext: user.address['street'],
                    ),
                    TextCard(
                      text: 'suite',
                      subtext: user.address['suite'],
                    ),
                    TextCard(
                      text: 'city',
                      subtext: user.address['city'],
                    ),
                  ],
                ),
                InfoCard(
                  title: 'phone',
                  description: user.phone,
                  icon: Icons.phone,
                ),
                InfoCard(
                  title: 'website',
                  description: user.website,
                  icon: Icons.web,
                ),
                InfoCard(
                  title: 'company',
                  description: user.company['name'],
                  icon: Icons.home,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
