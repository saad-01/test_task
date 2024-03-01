import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeViewModel extends GetxController {
  var responseData = ''.obs;
  List<dynamic> data = [];
  List<String> names = [];

  void fetchData() async {
    var url = 'https://tp-flutter-test.vercel.app/v1/category';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      responseData.value = response.body;
      data = jsonDecode(responseData.value);
      for (var element in data) {
        String name = element['name'];
        names.add(name);
      }
    } else {
      responseData.value = 'Error fetching data';
    }
  }

  int totalProductsByCategory(String categoryName) {
    int totalProducts = 0;
    for (var element in data) {
      if (element['name'] == categoryName) {
        List<dynamic> subCategories = element['subCategory'];
        for (var subCategory in subCategories) {
          List<dynamic> products = subCategory['products'];
          totalProducts += products.length;
        }
      }
    }
    return totalProducts;
  }
}
