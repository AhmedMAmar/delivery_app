import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Order>> fetchOrder() async {
  Uri url =
      Uri.parse("https://backend-server-flutter-app.herokuapp.com/api/orders");
  var data = await http.get(url);
  var jsonData = json.decode(data.body);

  List<Order> items = [];
  for (var or in jsonData) {
    Order o = Order(
        nameClient: or["nameClient"],
        nameOrder: or["nameOrder"],
        priceOrder: or["priceOrder"],
        imageOrder: or["imageOrder"],
        latitude: or["latitude"],
        longitude: or["longitude"]);
    items.add(o);
  }
  return items;
}

class Order {
  final String nameClient;
  final String nameOrder;
  final String priceOrder;
  final String imageOrder;
  final String latitude;
  final String longitude;

  Order(
      {required this.nameClient,
      required this.nameOrder,
      required this.priceOrder,
      required this.imageOrder,
      required this.latitude,
      required this.longitude});
}
