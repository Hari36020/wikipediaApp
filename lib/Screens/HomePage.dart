import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:valuelabs_app/Models/listViewModel.dart';
import 'package:valuelabs_app/Providers/HomePageProvider.dart';
import 'package:valuelabs_app/Screens/itemScreen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = false;
  List<dynamic> items = [];

  @override
  // void initState() {
  //   final listdata = Provider.of<HomePageProvider>(context,listen: false);
  //
  //   if (listdata.items.length == 0) {
  //     setState(() {
  //       _isLoading = true;
  //     });}
  //   listdata.listItems().then((_) {
  //     setState(() {
  //
  //       _isLoading = false;
  //       print("aaaaaaaaaa");
  //     });
  //
  //   });
  // }
  final queryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    items = Provider.of<HomePageProvider>(context).items;

    return Scaffold(
      appBar: AppBar(
        title: Text("Wikipedia"),
        centerTitle: true,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: queryController,

                        style: TextStyle(fontSize: 15.0, color: Colors.black),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search..',
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 6.0, top: 8.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onChanged: (val) {

                            Provider.of<HomePageProvider>(context,
                                    listen: false)
                                .listItems(val.toString());
                          }

                      ),
                      items.length != 0 ? Container(
                        height: MediaQuery.of(context).size.height * 0.6,
                        width: MediaQuery.of(context).size.width * 1,
                        child: ListView.builder(
                            itemCount: items[1].length,
                            itemBuilder: (BuildContext context, int index) {
                              //    print( items[index].terms == null? items[index].terms.toString() :items[index].terms);
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: GestureDetector(
                                    child: Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: (Text(items[1][index])
                                            // ListTile(
                                            //   leading:   Image.network(items[index].thumbnail != null ? items[index].thumbnail['source'] : "https://www.freeiconspng.com/uploads/no-image-icon-13.png" ,height: 80,width: 60,),
                                            //   title:   Text(items[index].title),
                                            //   subtitle: Text(items[index].terms != null? items[index].terms['description'][0] : ""),
                                            // )

                                            ),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                InAppWebViewScreen(
                                                    url: items[3][index],title: items[1][index],)),
                                      );
                                    }),
                              );
                            }),
                      ) : Padding(
                        padding: const EdgeInsets.symmetric(vertical: 150),
                        child: Center(child: Text("Search something!!",style: TextStyle(fontWeight: FontWeight.bold),),),
                      ),

                    ],
                  )),
            ),
    );
  }
}
