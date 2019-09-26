import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class BinRoute {
//https://ssdlive.argyll-bute.gov.uk:8443/binuplift/api/web/properties/uprn/000125029348
/*
<response>
  <item>
    <id>47051</id>
    <caguprn>000125029348</caguprn>
    <easting>234462</easting>
    <northing>678211</northing>
    <fulladdress>7 XXXX Avenue, Cardross, Dumbarton G82 5NG</fulladdress>
    <address1/>
    <address2/>
    <address3>7 XXXX Avenue</address3>
    <address4/>
    <address5>Cardross</address5>
    <address6>Dumbarton</address6>
    <postcode>G82 5XX</postcode>
    <usrn>1001558</usrn>
    <street>Kilmahew Avenue</street>
    <note/>
    <refuseareaname>HEL</refuseareaname>
    <routename>LOM01</routename>
  </item>
</response>
*/

  //https://ssdlive.argyll-bute.gov.uk:8443/binuplift/api/web/properties/uprn/000125029348/dates
  /*
  <response>
    <item>
      <route>LOM01</route>
      <wastetype>Recycling</wastetype>
      <collectiontype>Domestic</collectiontype>
      <collectiondate>2019-09-30</collectiondate>
      <ruid>2042</ruid>
      <calyear>2018/2019</calyear>
    </item>
    <item>
      <route>LOM01</route>
      <wastetype>Glass</wastetype>
      <collectiontype>Domestic</collectiontype>
      <collectiondate>2019-09-30</collectiondate>
      <ruid>2043</ruid>
      <calyear>2018/2019</calyear>
    </item>
    <item>
      <route>LOM01</route>
      <wastetype>Food</wastetype>
      <collectiontype>Domestic</collectiontype>
      <collectiondate>2019-09-30</collectiondate>
      <ruid>2044</ruid>
      <calyear>2018/2019</calyear>
    </item>
  </response>
  */

  String url = "https://www.argyll-bute.gov.uk/";

  String xml = """
  <response>
  <item>
  <route>LOM01</route>
  <wastetype>Recycling</wastetype>
  <collectiontype>Domestic</collectiontype>
  <collectiondate>2019-09-30</collectiondate>
  <ruid>2042</ruid>
  <calyear>2018/2019</calyear>
  </item>
  <item>
  <route>LOM01</route>
  <wastetype>Glass</wastetype>
  <collectiontype>Domestic</collectiontype>
  <collectiondate>2019-09-30</collectiondate>
  <ruid>2043</ruid>
  <calyear>2018/2019</calyear>
  </item>
  <item>
  <route>LOM01</route>
  <wastetype>Food</wastetype>
  <collectiontype>Domestic</collectiontype>
  <collectiondate>2019-09-30</collectiondate>
  <ruid>2044</ruid>
  <calyear>2018/2019</calyear>
  </item>
  </response>""";

  Future getBinRouteFromUPRN(String uprn) async {
    //
    String requestURL = '$url$uprn';

    client.badCertificateCallback =
    ((X509Certificate cert, String host, int port) => true);

    HttpClientRequest request = await client.postUrl(Uri.parse(requestURL));
    HttpClientResponse response = await request.close();
    String reply = await response.transform(utf8.decoder).join();

    //print(reply);
    var decodedData = jsonDecode(reply);
    //print(decodedData["features"]);
    //print(decodedData['features'].runtimeType);
    return (decodedData['features']);
     */
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
}
