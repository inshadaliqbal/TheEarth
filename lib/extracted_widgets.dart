import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theearth/provider_engine.dart';
import 'package:theearth/style.dart';
import 'package:flutter_popup/flutter_popup.dart';

import 'constants.dart';
import 'country_class.dart';

class ContinentCard extends StatelessWidget {
  const ContinentCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String? textFieldValue;
    String? selectedSubRegion;

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
              decoration: continentCardBoxDecoration,
              child: GestureDetector(
                onTap: () {
                  Provider.of<MainEngine>(context,listen: false).updateCountryDataList(index, selectedSubRegion);
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        print(
                            Provider.of<MainEngine>(context).subRegion(index));
                        return Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: 100,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          CustomPopup(
                                            contentPadding: EdgeInsets.all(10),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Filter',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.filter_alt_outlined,
                                                  size: 15,
                                                ),
                                              ],
                                            ),
                                            content: ListView.builder(
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index1) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    selectedSubRegion =
                                                        Provider.of<MainEngine>(
                                                                context,
                                                                listen: false)
                                                            .subRegion(
                                                                index)[index1];
                                                    Provider.of<MainEngine>(context,listen: false).updateCountryDataList(index, selectedSubRegion);
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.blueGrey,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    padding: EdgeInsets.all(20),
                                                    margin: EdgeInsets.all(10),
                                                    child: Text(
                                                        Provider.of<MainEngine>(
                                                                context)
                                                            .subRegion(
                                                                index)[index1]),
                                                  ),
                                                );
                                              },
                                              itemCount:
                                                  Provider.of<MainEngine>(
                                                          context)
                                                      .subRegion(index)
                                                      .length,
                                            ),
                                            // Column(
                                            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            //   children: Provider.of<MainEngine>(context).subRegion(index),
                                            // ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5, horizontal: 20),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Colors.teal),
                                              child: Text(
                                                'Countries Inside ${Provider.of<MainEngine>(context).continentName(index)}',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  letterSpacing: 2,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: TextField(
                                        onChanged: (value) {
                                          Provider.of<MainEngine>(context,
                                                  listen: false)
                                              .searchCountryFuntion(
                                                  value,index);
                                        },
                                        decoration: InputDecoration(
                                          hintText: 'Search Country',
                                          hintStyle:
                                              TextStyle(color: Colors.black),
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 15.0, horizontal: 20.0),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            borderSide: BorderSide(
                                              color: Colors.teal,
                                              width: 2.0,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            borderSide: BorderSide(
                                              color: Colors.teal,
                                              width: 2.0,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            borderSide: BorderSide(
                                              color: Colors.teal,
                                              width: 2.0,
                                            ),
                                          ),
                                          suffixIcon: Icon(
                                            Icons.search,
                                            color: Colors.teal,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: MyListViewWithExpansionPanel(
                                itemList: Provider.of<MainEngine>(context)
                                    .mainCOuntryListFunction(),
                              ),
                            ),
                          ],
                        );
                      });
                },
                child: Column(
                  children: [
                    Container(
                      child: Text('content gif'),
                    ),
                    Text(
                        "${Provider.of<MainEngine>(context).continentName(index)}",
                        style: kContinentNameTextStyle),
                    Expanded(
                      child: Container(
                        width: 200,
                        margin: EdgeInsets.all(10),
                        child: Text(
                            "${Provider.of<MainEngine>(context).continentDiscription(Provider.of<MainEngine>(context).continentName(index))}",
                            style: kContinentDescTextStyle),
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

class MyListViewWithExpansionPanel extends StatefulWidget {
  List<CountryData> itemList;
  MyListViewWithExpansionPanel({required this.itemList});

  @override
  State<MyListViewWithExpansionPanel> createState() =>
      _MyListViewWithExpansionPanelState();
}

class _MyListViewWithExpansionPanelState
    extends State<MyListViewWithExpansionPanel> {
  @override
  Widget build(BuildContext context) {
    final List<CountryData> items = widget.itemList;
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          child: ExpansionPanelList(
            expansionCallback: (panelIndex, isExpanded) {
              widget.itemList[index].changeExpandle();
              setState(() {});
            },
            children: [
              ExpansionPanel(
                canTapOnHeader: true,
                backgroundColor: Colors.blueGrey,
                headerBuilder: (context, isExpanded) {
                  return ListTile(
                    trailing: Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.all(5),
                      child: Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(items[index].flagURL!),
                      ),
                    ),
                    title: Text("${items[index].officialName}"),
                  );
                },
                body: GestureDetector(
                  child: Container(
                    color: Colors.blueGrey,
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Text(
                      'The ${items[index].commonName} as the Common name, ${items[index].officialName} contains population of ${items[index].population} and it is a Sub Region of ${items[index].subContinent}',
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ),
                ),
                isExpanded: widget.itemList[index]
                    .isExpandable!, // Change to true if you want it to be initially expanded
              ),
            ],
          ),
        );
      },
    );
  }
}
