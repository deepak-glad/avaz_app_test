import 'package:flutter/material.dart';

class FinalPage extends StatelessWidget {
  final List data;
  FinalPage(this.data);
  @override
  Widget build(BuildContext context) {
    print(data.length);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Thank you for signin up',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 29,
                          fontWeight: FontWeight.w400)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('User likes to eat',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w300)),
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    alignment: Alignment.center,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          print(index);
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${index + 1}.${data[index]}',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20),
                            ),
                          );
                        }))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
