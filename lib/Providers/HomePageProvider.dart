import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:valuelabs_app/Models/listViewModel.dart';

class HomePageProvider with ChangeNotifier {
  List<dynamic> _items = [];
  List<dynamic> get items {
    return [..._items];
  }


  Future<void> listItems(searchTerm) async {
    var url = 'https://en.wikipedia.org/w/api.php?origin=*&action=opensearch&search=' + searchTerm;
    //    'https://en.wikipedia.org/w/api.php?action=query&format=json&prop=pageimages%7Cpageterms&titles=Albert%20Einstein%7CAlbert%20Ellis%7CAlbert%20Estopinal&redirects=1&formatversion=2';
    try {
      final response = await http.get(url,headers: {"Accept":"application/json"});
      final extractedData = json.decode(response.body) as List<dynamic>;
      print(extractedData[1].toString());
      //
      // List<ListViewModel> listItems = [];
      //
      // if (extractedData == null) {
      //   return;
      // }
      //
      // extractedData['query']['pages'].forEach((pages) {
      //
      //   listItems.add(ListViewModel(
      //     pageid : pages["pageid"],
      //     ns:  pages['ns'],
      //     thumbnail:  pages['thumbnail'],
      //     pageimage:  pages['pageimage'],
      //     title: pages['title'],
      //     terms: pages['terms']
      //       )
      //   );
      // });
      _items = extractedData;


      notifyListeners();
      // return noticesList;
    } catch (error) {
      throw (error);
    }
  }
}
