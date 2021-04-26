import 'package:flutter/material.dart';
import 'package:turgent/components/chatTile.dart';

class OnlineAgent extends StatefulWidget {
  @override
  _OnlineAgentState createState() => _OnlineAgentState();
}

class _OnlineAgentState extends State<OnlineAgent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Online Agents'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          chatTile(
              image: "https://picsum.photos/200",
              message: "Hi John, hows it going",
              name: "Peter",
              time: "1:45am"),
          chatTile(
              image: "https://picsum.photos/200/300?grayscale",
              message: "Its been a while",
              name: "Ada",
              time: "2am"),
          chatTile(
              image: "https://picsum.photos/200/300/?blur",
              message: "Lets talk about sales",
              name: "Rita",
              time: "3pm"),
          chatTile(
              image: "https://placebeard.it/640/480",
              message: "how much is the product",
              name: "Jane",
              time: "2:31pm"),
          chatTile(
              image: "https://loremflickr.com/640/360",
              message: "i am interested",
              name: "Smart",
              time: "4:11pm"),
          chatTile(
              image: "https://placebeard.it/640x360",
              message: "shoes or bags??",
              name: "Tega",
              time: "1:30pm"),
        ],
      ),
    );
  }
}
