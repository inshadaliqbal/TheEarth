import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theearth/country_page.dart';
import 'package:theearth/loading_page.dart';
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
                  Provider.of<MainEngine>(context, listen: false)
                      .updateCountryDataList(index, selectedSubRegion);
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
                                          PopUpWidgetBottomSheet(
                                            functionOnTap: (value) {
                                              selectedSubRegion =
                                                  Provider.of<MainEngine>(
                                                          context,
                                                          listen: false)
                                                      .subRegion(index)[value];
                                              Provider.of<MainEngine>(context,
                                                      listen: false)
                                                  .updateCountryDataList(
                                                      index, selectedSubRegion);
                                            },
                                            index: index,
                                          ),
                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5, horizontal: 20),
                                              decoration: bottomSheetTitleDecoration,
                                              child: Text(
                                                'Countries Inside ${Provider.of<MainEngine>(context).continentName(index)}',
                                                style: kBottomSheetHeadingTextStyle,
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
                                                  value, index);
                                        },
                                        decoration: textFieldInputDecoration,
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
                                    .mainCountryListFunction(),
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

class PopUpWidgetBottomSheet extends StatelessWidget {
  Function? functionOnTap;
  int? index;
  PopUpWidgetBottomSheet({required this.functionOnTap, required this.index});

  @override
  Widget build(BuildContext context) {
    return CustomPopup(
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
        itemBuilder: (BuildContext context, int index1) {
          return GestureDetector(
            onTap: () {
              functionOnTap!(index1);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(10),
              child: Text(
                  Provider.of<MainEngine>(context).subRegion(index!)[index1]),
            ),
          );
        },
        itemCount: Provider.of<MainEngine>(context).subRegion(index!).length,
      ),
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   children: Provider.of<MainEngine>(context).subRegion(index),
      // ),
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
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return LoadingScreen(dataForCountryPage: items[index]);
                        },
                      ),
                    );
                  },
                  child: Container(
                    color: Colors.blueGrey,
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Text(
                      'The ${items[index].commonName} as the Common name, ${items[index].officialName} contains population of ${items[index].population} and it is a Sub Region of ${items[index].subContinent}',
                      style: kCountryDescTestStyle,
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
