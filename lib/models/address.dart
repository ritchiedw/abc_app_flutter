import 'dart:convert';
import 'dart:io';
import 'package:abc_app_flutter/helpers/example_json.dart';
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

  List<String> addresses = [];

  Future getAddressFromPostcode(String postcode) async {
    print("getAddressFromPostcode()");

    String requestURL = '$url${postcode.toUpperCase()}$endUrl';
    print(requestURL);

    ExampleJson ej = ExampleJson();
    var decodedData = jsonDecode(ej.json);
    var features = decodedData['features'];
    print(features.runtimeType);
    print(decodedData['features']);
    return (decodedData['features']);

    //*************************************************
    try {
      HttpClient client = new HttpClient();
      //client.findProxy()
      client.connectionTimeout = Duration(seconds: 3);

      client.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);

      HttpClientRequest request = await client.postUrl(Uri.parse(requestURL));
      HttpClientResponse response = await request.close();
      String reply = await response.transform(utf8.decoder).join();

      //print(reply);
      var decodedData = jsonDecode(reply);
      print(decodedData["features"]);
      print(decodedData['features'].runtimeType);
      return (decodedData['features']);
    } catch (e) {
      print(e.runtimeType);
      ExampleJson ej = ExampleJson();
      var decodedData = jsonDecode(ej.json);
      print(decodedData['features']);
      //return (decodedData['features']);
      //print(decodedData);
      //print("*****************************");
      //print(decodedData["features"]);
      //print("*****************************");
      //print(decodedData['features'].runtimeType);
      //print("*****************************");
      //[{attributes: {ADDRESS: 3 Cossack Street Lochgilphead Argyll And Bute PA31 8JW , //UPRN: 000125006813}, geometry: {x: 186468.64, y: 687747.67}}
      var jsonString = '[{"attributes": {"ADDRESS": "Problem", "UPRN": "0"}}]';
      var errorReturn = jsonDecode(jsonString);
      print(errorReturn);
      //print(errorReturn['attributes']);
      //print(errorReturn['attributes']['ADDRESS']);
      return (errorReturn);
    }
    //*************************************************
    /*
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
     */
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
