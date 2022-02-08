import 'package:flutter/material.dart';
import 'signup_screen.dart';
import 'signup3_screen.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class SignUp2 extends StatefulWidget {
  const SignUp2({Key? key}) : super(key: key);

  @override
  _SignUp2State createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {

  get dropList => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Farm Details',
          style: TextStyle(
            letterSpacing: 3.1,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const SignUp()));
          },
          color: Colors.white,
        ),
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              '2/3',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
                letterSpacing: 1.1,
              ),
            ),
          )
        ],
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            const SizedBox(height: 25),
            DropdownButtonFormField(
              hint: const Text(
                'Select Crop',
                style: TextStyle(
                    fontSize: 12.0,
                    letterSpacing: 1.1,
                    fontWeight: FontWeight.bold),
              ),
              items: <String>[
                'Grain',
                'Cocoa',
                'Millet',
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.grass_outlined),
                enabledBorder: UnderlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                border: UnderlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 8),
                  borderRadius: BorderRadius.circular(20),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              validator: (value) => value == null ? "Select a Gender" : null,
              dropdownColor: Colors.white,
              onChanged: (_) {},
            ),
            const SizedBox(
              height: 20,
            ),
            DropdownButtonFormField(
              hint: const Text(
                'Select Cell',
                style: TextStyle(
                    fontSize: 12.0,
                    letterSpacing: 1.1,
                    fontWeight: FontWeight.bold),
              ),
              items: <String>[
                'Cell1',
                'Cell2',
                'Cell3',
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                border: UnderlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 8),
                  borderRadius: BorderRadius.circular(20),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              validator: (value) => value == null ? "Select a Status" : null,
              dropdownColor: Colors.white,
              onChanged: (_) {},
            ),
            const SizedBox(
              height: 20,
            ),
              DropdownButtonFormField(
                hint: const Text(
                  'Select Cooperative',
                  style: TextStyle(
                      fontSize: 12.0,
                      letterSpacing: 1.1,
                      fontWeight: FontWeight.bold),
                ),
                items: <String>[
                  'Coorp1',
                  'Coorp2',
                  'Coorp3',
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  border: UnderlineInputBorder(
                    borderSide:const BorderSide(color: Colors.grey, width: 8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (value) => value == null ? "Select a Status" : null,
                dropdownColor: Colors.white,
                onChanged: (_) {},
              ),
                const SizedBox(height: 20,
                ),
          //   DropdownButton(
          //   items: [
          //     DropdownMenuItem(
          //       child: Row(
          //         children: <Widget>[
          //           Checkbox(
          //             onChanged: (_){},
          //              value: _firstValue,
          //           ),
          //           const Text('First'),
          //         ],
          //       ),
          //     ),
          //     DropdownMenuItem(
          //       child: Row(
          //         children: <Widget>[
          //           Checkbox(
          //             onChanged: (_){},
          //             value: _secValue,
          //           ),
          //           const Text('Second'),
          //         ],
          //       ),
          //     )
          //   ],
          //   onChanged: (value) {
          //   },
          //   hint: const Text('Select value'),
          // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                    fillColor: Colors.grey,
                    focusColor: Colors.grey,
                    labelText: "Farm Size(hectares)",
                    labelStyle: TextStyle(
                        fontSize: 12,
                        letterSpacing: 1.1,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold)),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  width: 200,
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.location_on_outlined),
                        fillColor: Colors.grey,
                        focusColor: Colors.grey,
                        labelText: "Latitude",
                        labelStyle: TextStyle(
                            fontSize: 12,
                            letterSpacing: 1.1,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold)),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Container(
                  width: 200,
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration:const InputDecoration(
                        prefixIcon: Icon(Icons.location_on_outlined),
                        fillColor: Colors.grey,
                        focusColor: Colors.grey,
                        labelText: "Longitude",
                        labelStyle: TextStyle(
                            fontSize: 12,
                            letterSpacing: 1.1,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold)),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height:10),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 50.0,
                    margin: const EdgeInsets.all(10),
                    child: RaisedButton(
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => farmerslist
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const SignUp()));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      padding:const EdgeInsets.all(0.0),
                      child: Ink(
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Colors.black, Colors.black],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Container(
                          constraints:
                              const BoxConstraints(maxWidth: 150.0, minHeight: 50.0),
                          alignment: Alignment.center,
                          child: const Text(
                            "PREVIOUS",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50.0,
                    margin: const EdgeInsets.all(10),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const SignUp3()));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      padding: const EdgeInsets.all(0.0),
                      child: Ink(
                        decoration: BoxDecoration(
                            color: Colors.blueGrey[900],
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Container(
                          constraints:
                              const BoxConstraints(maxWidth: 150.0, minHeight: 50.0),
                          alignment: Alignment.center,
                          child: const Text(
                            "NEXT",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 190.0),
          ]),
        ),
      ),
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: Colors.blueGrey[900],
          items: const [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.map, title: 'Discovery'),
            TabItem(icon: Icons.message, title: 'Message'),
            TabItem(icon: Icons.people, title: 'Profile'),
          ],

        )
    );
  }
}



