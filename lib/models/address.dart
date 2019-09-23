import 'dart:convert';
import 'package:http/http.dart' as http;

class Address {
  String postcode;
  String addressLine1;
  String addressLine2;
  String addressLine3;
  String addressLine4;

  String url =
      "https://arcgis.argyll-bute.gov.uk/arcgis/rest/services/CAG_and_Council_Property/MapServer/0/query?text=";
  String endUrl = "&outFields=ADDRESS%2C+UPRN&f=pjson";

  getAddressFromPostcode(String postcode) async {
    String requestURL = '$url$postcode$endUrl';

    http.Response response = await http.get(requestURL);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      print(decodedData);
      //var lastPrice = decodedData['last'];
      return decodedData;
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
/*
  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
          getData();
        });
      },
    );
  }
  */

}
