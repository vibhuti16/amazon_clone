import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DealOfTheDay extends StatefulWidget {
  const DealOfTheDay({Key? key}) : super(key: key);

  @override
  State<DealOfTheDay> createState() => _DealOfTheDayState();
}

class _DealOfTheDayState extends State<DealOfTheDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 10, top: 15),
          child: Text(
            "Deal of the Day",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Image.network(
          "https://images.unsplash.com/photo-1667293455348-8e30a4e27e0a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDJ8QkpKTXR0ZURKQTR8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60",
          height: 235,
          fit: BoxFit.fitHeight,
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 15),
          child: const Text(
            "\$100",
            style: TextStyle(fontSize: 18),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 15, top: 5, right: 40),
          child: Text(
            "Vibhuti",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 15).copyWith(top: 15),
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                "https://images.unsplash.com/photo-1668285410063-4e5f2686b55d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60",
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
              Image.network(
                  "https://images.unsplash.com/photo-1668285410063-4e5f2686b55d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60",
                  fit: BoxFit.fitWidth,
                  width: 100,
                  height: 100),
              Image.network(
                  "https://images.unsplash.com/photo-1668285410063-4e5f2686b55d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60",
                  fit: BoxFit.fitWidth,
                  width: 100,
                  height: 100),
              Image.network(
                  "https://images.unsplash.com/photo-1668285410063-4e5f2686b55d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60",
                  fit: BoxFit.fitWidth,
                  width: 100,
                  height: 100)
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 15,
          ).copyWith(left: 15),
          alignment: Alignment.topLeft,
          child: Text(
            "See all deals",
            style: TextStyle(color: Colors.cyan[800]),
          ),
        )
      ],
    );
  }
}
