import 'package:flutter/material.dart';

class CompanyInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(title: Text('Company Info'),backgroundColor: Colors.blueGrey,),
      body: Padding(

        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],  // Define the colors of the gradient
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),  // Match the border radius to the card
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Company: Geeksynergy Technologies Pvt Ltd',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                Text('Address: Sanjayanagar, Bengaluru-56',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold)),
                Text('Phone: XXXXXXXXX09',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold)),
                Text('Email: XXXXXX@gmail.com',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
