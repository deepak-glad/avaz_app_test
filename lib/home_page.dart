import 'package:avaz_app/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:oauth2_client/google_oauth2_client.dart';
import 'package:oauth2_client/oauth2_helper.dart';

import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var image = [
    'assets/ice.jpg',
    'assets/biryani.jpg',
    'assets/dal.jpg',
    'assets/burger.jpg',
    'assets/ch.jpg',
    'assets/pizza.jpg'
  ];
  var name = ['ice Cream', 'Biryani', 'Dal', 'Burger', 'chowmein', 'Pizza'];
  var arrdata = [];

  // _api(String search) async {
  //   var url = Uri.parse('http://api.thenounproject.com/icon/$search');
  //   http.Response response = await http.get(url, headers: {
  //     "Accept": "application/json",
  //     'Content-Type': 'application/json; charset=UTF-8',
  //     'Consumer-Key': '7a49034fa670416c8bef0ca354467442',
  //     'Consumer-Secret': 'ca1891aaa6844336ac890daa6fa0fc5d'
  //   });
  //   print(response.body);
  // }

  // _apiData() async {
  //   var auth = oauth1.ClientCredentials(
  //       "7a49034fa670416c8bef0ca354467442", "ca1891aaa6844336ac890daa6fa0fc5d");
  //   print(auth);
  //   //  var auth = OAuth1("your-api-key", "your-api-secret");
  //   //   endpoint = "http://api.thenounproject.com/icon/1";
  // }

  // Future<void> _apiData() async {
  //   var hlp = OAuth2Helper(
  //     GoogleOAuth2Client(
  //         redirectUri: 'http://api.thenounproject.com/icon/pancake',
  //         customUriScheme: 'com.example.avaz_app'),
  //     grantType: OAuth2Helper.AUTHORIZATION_CODE,
  //     clientId: '7a49034fa670416c8bef0ca354467442',
  //     clientSecret: 'ca1891aaa6844336ac890daa6fa0fc5d',
  //     scopes: ['https://www.googleapis.com/auth/drive.readonly'],
  //   );

  //   var resp = await hlp.get('http://api.thenounproject.com/icon/pancake');

  //   print(resp.body);
  // }

  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
            padding: const EdgeInsets.all(15),
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).size.height / 3,
            color: Colors.transparent, //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                        onPressed: () {}, child: const Text('Save'))),
                const TextField(
                  // decoration: InputDecoration(
                  //     hintText: 'What option do you want to add?'),
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      labelText: 'What option do you want to add?',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // _api('pancake');
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(height: 50),
              Text('Tell us about yourself',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 29,
                      fontWeight: FontWeight.w400)),
              Text('What do you like to eat?',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w300)),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: image.length,
                    itemBuilder: (context, index) {
                      return Column(
                        // shrinkWrap: true,
                        // scrollDirection: Axis.horizontal,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                arrdata.contains(name[index])
                                    ? arrdata.remove(name[index])
                                    : arrdata.length < 5
                                        ? arrdata.add(name[index])
                                        : ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                            const SnackBar(
                                                content: Text(
                                                    'you can select more than five'),
                                                backgroundColor: Colors.red),
                                          );
                                print(arrdata.last);
                              });
                            },
                            child: Stack(children: [
                              Container(
                                margin: const EdgeInsets.all(15),
                                height: 100,
                                width: 100,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black,
                                          blurRadius: .5,
                                          spreadRadius: 0.0)
                                    ],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: Image.asset(
                                  image[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              if (arrdata.contains(name[index]))
                                const Padding(
                                  padding: EdgeInsets.only(top: 20.0, left: 20),
                                  child: Icon(
                                    Icons.check_circle_rounded,
                                    size: 20,
                                    color: Colors.blue,
                                  ),
                                ),
                            ]),
                          ),
                          Center(child: Text(name[index].toString())),
                        ],
                      );
                    }),
              ),
              Center(
                  child: Text('Or',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w400))),
              Text('Add your own',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w300)),
              // Stack(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: _modalBottomSheetMenu,
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                blurRadius: .5,
                                spreadRadius: 0.0)
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Icon(
                        Icons.add,
                        size: 100,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  // Container(
                  //   width: MediaQuery.of(context).size.width - 150,
                  //   height: 150,
                  //   child: ListView.builder(
                  //       scrollDirection: Axis.horizontal,
                  //       shrinkWrap: true,
                  //       itemCount: 1,
                  //       itemBuilder: (context, index) {
                  //         return Stack(children: [
                  //           Container(
                  //             margin: const EdgeInsets.all(8),
                  //             height: 100,
                  //             width: 100,
                  //             decoration: const BoxDecoration(
                  //                 color: Colors.white,
                  //                 boxShadow: [
                  //                   BoxShadow(
                  //                       color: Colors.black,
                  //                       blurRadius: .5,
                  //                       spreadRadius: 0.0)
                  //                 ],
                  //                 borderRadius:
                  //                     BorderRadius.all(Radius.circular(15))),
                  //           ),
                  //           Padding(
                  //             padding:
                  //                 const EdgeInsets.only(top: 15.0, left: 11),
                  //             child: Icon(
                  //               Icons.check_circle_rounded,
                  //               size: 20,
                  //               color: Theme.of(context).primaryColor,
                  //             ),
                  //           ),
                  //         ]);
                  //       }),
                  // ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: FlatButton(
                    height: 50,
                    minWidth: MediaQuery.of(context).size.width,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    color: Theme.of(context).primaryColor,
                    onPressed: arrdata.length > 2
                        ? () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => FinalPage(arrdata)));
                          }
                        : () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('please select minimum three '),
                                  backgroundColor: Colors.red),
                            );
                          },
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
