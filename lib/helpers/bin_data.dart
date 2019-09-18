import 'dart:convert';
import 'package:http/http.dart' as http;

class BinData {
  //query?text=Argyll+Street+C&outFields=ADDRESS%2C+UPRN&f=pjson
  static const binApiUrl = 'http://argyll-bute.gov.uk';
  static const postcodeUrl =
      'https://arcgis.argyll-bute.gov.uk/arcgis/rest/services/CAG_and_Council_Property/MapServer/0/query?where=&text=';
  static const trailingPart = '&f=pjson';

  Future<Map> getAddressData(String postcode) async {
    String requestUrl = '$postcodeUrl$postcode$trailingPart';

    http.Response response = await http.get(requestUrl);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      //var lastPrice = decodedData['last'];
      //return lastPrice;
      //cryptoValues[crypto] = lastPrice.toStringAsFixed(0);
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}

/*
https://arcgis.argyll-bute.gov.uk/arcgis/rest/services/CAG_and_Council_Property/MapServer/0/query?where=&text=PA31+8JW&objectIds=&time=&geometry=&geometryType=esriGeometryEnvelope&inSR=&spatialRel=esriSpatialRelIntersects&relationParam=&outFields=&returnGeometry=true&returnTrueCurves=false&maxAllowableOffset=&geometryPrecision=&outSR=&returnIdsOnly=false&returnCountOnly=false&orderByFields=&groupByFieldsForStatistics=&outStatistics=&returnZ=false&returnM=false&gdbVersion=&returnDistinctValues=false&resultOffset=&resultRecordCount=&queryByDistance=&returnExtentsOnly=false&datumTransformation=&parameterValues=&rangeValues=&f=html

 */
