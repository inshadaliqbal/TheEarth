import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theearth/pages/loading_page.dart';
import 'package:theearth/helpers/provider_engine.dart';
import 'package:theearth/constants/style.dart';
import 'package:flutter_popup/flutter_popup.dart';
import '../constants/constants.dart';
import '../constants/country_class.dart';

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
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: continentCardBoxDecoration,
              child: GestureDetector(
                onTap: () {
                  Provider.of<MainEngine>(context, listen: false)
                      .updateCountryDataList(index, selectedSubRegion);
                  showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20.0),
                        ),
                      ),
                      backgroundColor: const Color(0xFF003C43).withOpacity(0.5),
                      context: context,
                      builder: (context) {
                        return Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    margin: EdgeInsets.all(10),
                                    decoration: bottomSheetTitleDecoration,
                                    child: Text(
                                      'Countries Inside ${Provider.of<MainEngine>(context).continentName(index)}',
                                      style: kBottomSheetHeadingTextStyle,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: TextField(
                                      onChanged: (value) {
                                        Provider.of<MainEngine>(context,
                                                listen: false)
                                            .searchCountry(value, index);
                                      },
                                      decoration: textFieldInputDecoration,
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            PopUpWidgetBottomSheet(
                              functionOnTap: (value) {
                                selectedSubRegion = Provider.of<MainEngine>(
                                        context,
                                        listen: false)
                                    .provideSubRegionList(index)[value];
                                Provider.of<MainEngine>(context, listen: false)
                                    .updateCountryDataList(
                                        index, selectedSubRegion);
                              },
                              index: index,
                            ),
                            Expanded(
                              flex: 2,
                              child: MyListViewWithExpansionPanel(
                                itemList: Provider.of<MainEngine>(context)
                                    .provideCountryList(),
                              ),
                            ),
                          ],
                        );
                      });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.transparent,
                          child: Image(
                            image: AssetImage('images/$index.png'),
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                      Text(
                          "${Provider.of<MainEngine>(context).continentName(index)}",
                          style: kContinentNameTextStyle),
                      Expanded(
                        child: Container(
                          width: 200,
                          margin: const EdgeInsets.all(10),
                          child: Text(
                              "${Provider.of<MainEngine>(context).continentDiscription(Provider.of<MainEngine>(context).continentName(index))}",
                              textAlign: TextAlign.center,
                              style: kContinentDescTextStyle),
                        ),
                      ),
                      const Icon(
                        Icons.arrow_drop_down,
                        size: 40,
                        color: Colors.white,
                      )
                    ],
                  ),
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
      backgroundColor: const Color(0xFF77B0AA),
      contentPadding: const EdgeInsets.all(10),
      content: ListView.builder(
        itemBuilder: (BuildContext context, int index1) {
          return GestureDetector(
            onTap: () {
              functionOnTap!(index1);
            },
            child: Container(
              decoration: popUpContainerDecoration,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(10),
              child: Center(
                child: Text(
                  Provider.of<MainEngine>(context).provideSubRegionList(index!)[index1],
                  style: kPopUpTextStyle
                ),
              ),
            ),
          );
        },
        itemCount: Provider.of<MainEngine>(context).provideSubRegionList(index!).length,
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Filter',
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
          Icon(
            Icons.filter_alt_outlined,
            size: 15,
            color: Colors.white,
          ),
        ],
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
                backgroundColor: const Color(0xFF003C4C),
                headerBuilder: (context, isExpanded) {
                  return ListTile(
                    trailing: Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.all(5),
                      child: Image(
                        fit: BoxFit.scaleDown,
                        image: NetworkImage(items[index].flagURL!),
                      ),
                    ),
                    title: Text(
                      "${items[index].commonName}",
                      style: kExpansionPanelTextStyle
                    ),
                  );
                },
                body: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return LoadingScreen(
                              dataForCountryPage: items[index]);
                        },
                      ),
                    );
                  },
                  child: Container(
                    color: Colors.transparent,
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              'The ${items[index].commonName} as the Common name, ${items[index].officialName} contains population of ${items[index].population} and it is a Sub Region of ${items[index].subContinent}',
                              style: kCountryDescTestStyle,
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 25,
                        )
                      ],
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
