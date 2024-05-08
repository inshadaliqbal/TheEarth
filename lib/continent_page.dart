import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theearth/provider_engine.dart';

class Continent extends StatelessWidget {
  const Continent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.tealAccent.shade700,
        elevation: 0.0,
        title: Center(
          child: Text('Explore the Continents',style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            letterSpacing: 1,
            fontWeight: FontWeight.w200,
          ),),
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/bg.jpg'), fit: BoxFit.fill)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Text(
                  'Select a Continent',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              ContinentCard()
            ],
          ),
        ),
      ),
    );
  }
}

class ContinentCard extends StatelessWidget {
  const ContinentCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: Provider.of<MainEngine>(context).continentCount,
          itemBuilder: (BuildContext context, int index) {
            // Your list item widget
            return Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  color: Colors.black.withOpacity(0.5)),
              child: GestureDetector(
                child: Column(
                  children: [
                    Container(
                      child: Text('content gif'),
                    ),
                    Text(
                      "${Provider.of<MainEngine>(context).continentName(index)}",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 200,
                        margin: EdgeInsets.all(10),
                        child: Text(
                          "${Provider.of<MainEngine>(context).continentDiscription(Provider.of<MainEngine>(context).continentName(index))}",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
