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
    String? selectedSubRegion; // Variable to store the selected sub-region

    return Container(
      height: 500,
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // Scroll direction of the list view
        itemCount: Provider.of<MainEngine>(context).continentCount, // Total number of continents
        itemBuilder: (BuildContext context, int index) {

          return Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: continentCardBoxDecoration,
            child: GestureDetector(
              onTap: () {
                // Function to execute when the container is tapped
                Provider.of<MainEngine>(context, listen: false)
                    .updateCountryDataList(index, selectedSubRegion); // Update country data list
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
                                  'Countries Inside ${Provider.of<MainEngine>(context).continentName(index)}', // Text to display
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
                                        .searchCountry(value, index); // Search for countries
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
                                .provideSubRegionList(index)[value]; // Get selected sub-region
                            Provider.of<MainEngine>(context, listen: false)
                                .updateCountryDataList(
                                index, selectedSubRegion); // Update country data list
                          },
                          index: index,
                        ),
                        Expanded(
                          flex: 2,
                          child: MyListViewWithExpansionPanel(
                            itemList: Provider.of<MainEngine>(context)
                                .provideCountryList(), // Provide country list
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 40, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.transparent,
                        child: Image(
                          image: AssetImage(
                              'images/$index.png'), // Image for the continent
                          fit: BoxFit
                              .scaleDown,
                        ),
                      ),
                    ),
                    Text(
                        "${Provider.of<MainEngine>(context).continentName(index)}",
                        style: kContinentNameTextStyle), // Text for continent name
                    Expanded(
                      child: Container(
                        width: 200,
                        margin: const EdgeInsets.all(10),
                        child: Text(
                            "${Provider.of<MainEngine>(context).continentDiscription(Provider.of<MainEngine>(context).continentName(index))}",
                            textAlign: TextAlign.center, // Text alignment
                            style: kContinentDescTextStyle),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_drop_down, // Icon for dropdown
                      size: 40,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class PopUpWidgetBottomSheet extends StatelessWidget {
  Function? functionOnTap; // Callback function to handle tap events
  int? index; // Index of the continent
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
              functionOnTap!(index1); // Calling the callback function when an item is tapped
            },
            child: Container(
              decoration: popUpContainerDecoration,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(10),
              child: Center(
                child: Text(
                    Provider.of<MainEngine>(context).provideSubRegionList(index!)[index1], // Text to display from the sub-region list
                    style: kPopUpTextStyle // Style for the text
                ),
              ),
            ),
          );
        },
        itemCount: Provider.of<MainEngine>(context).provideSubRegionList(index!).length, // Total number of items in the sub-region list
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
    );
  }
}

class MyListViewWithExpansionPanel extends StatefulWidget {
  List<CountryData> itemList; // List of country data
  MyListViewWithExpansionPanel({required this.itemList});

  @override
  State<MyListViewWithExpansionPanel> createState() =>
      _MyListViewWithExpansionPanelState();
}

class _MyListViewWithExpansionPanelState
    extends State<MyListViewWithExpansionPanel> {
  @override
  Widget build(BuildContext context) {
    final List<CountryData> items = widget.itemList; // Get itemList from the widget

    return ListView.builder(
      itemCount: items.length, // Total number of items in the list
      itemBuilder: (context, index) {
        return Card(
          child: ExpansionPanelList(
            expansionCallback: (panelIndex, isExpanded) {
              widget.itemList[index].changeExpandle(); // Change expandable state of the item
              setState(() {}); // Update UI
            },
            children: [
              ExpansionPanel(
                canTapOnHeader: true, // Allow tapping on the header
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
                      style: kExpansionPanelTextStyle,
                    ),
                  );
                },
                body: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return LoadingScreen(
                              dataForCountryPage: items[index]); // Navigate to loading screen with country data
                        },
                      ),
                    );
                  },
                  child: Container(
                    color: Colors.transparent,
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.min, // Main axis size
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10), // Padding for the text
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
