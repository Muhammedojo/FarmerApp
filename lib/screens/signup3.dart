import 'package:dashboard/screens/cooperative_list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/bank.dart';
import './signup2.dart';
import './dash.dart';
import './cooperative_list_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class SignUp3 extends StatefulWidget {
  const SignUp3({Key? key}) : super(key: key);

  @override
  _SignUp3State createState() => _SignUp3State();
}

class _SignUp3State extends State<SignUp3> {
  List<dynamic> list = [];
  List<Bank> bankList = [];
  List<dynamic> list2 = [];
  List<String> banks = [
    'Access Bank',
    'Citibank',
    'Diamond Bank',
    'Dynamic Standard Bank',
    'Ecobank Nigeria',
    'Fidelity Bank Nigeria',
    'First Bank of Nigeria',
    'First City Monument Bank',
    'Guaranty Trust Bank',
    'Heritage Bank Plc',
    'Jaiz Bank',
    'Keystone Bank Limited'
  ];

  String? selectedBankName;

  //controller for modal
  final TextEditingController accController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  File? image;
  bool isChecked = true;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('Failed to Pick an image: $e');
    }
  }

  Future galleryImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('Failed to Pick an image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Banking Details',
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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignUp2()));
          },
          color: Colors.white,
        ),
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              '3/3',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
          )
        ],
        backgroundColor: Colors.blueGrey[900],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FlatButton.icon(
              color: Colors.white,
              icon: const Icon(
                Icons.add_a_photo_rounded,
                color: Colors.blue,
              ),
              onPressed: () {
                pickImage();
              },
              label: ClipOval(
                child: image != null
                    ? Image.file(
                        image!,
                        width: 160,
                        height: 160,
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        'https://cdn-icons-png.flaticon.com/128/3237/3237472.png',
                        width: 160,
                      ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  const SizedBox(
                    width: 110,
                  ),
                  ElevatedButton.icon(
                      onPressed: () {
                        galleryImage();
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      icon: const Icon(Icons.menu, color: Colors.black),
                      label: const Text(
                        'Open Gallery',
                        style: TextStyle(color: Colors.black),
                      )),
                ],
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.account_balance_wallet),
                      labelText: "Bank Verification Number"),
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),

            Flexible(
              child: ListView.builder(
                itemCount: bankList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  Bank bank = bankList[index];
                  return Card(
                    elevation: 2,
                    child: ListTile(
                      title: Text("${bank.bankName}"),
                      subtitle:
                          Text("${bank.accountName}\n${bank.accountNumber}"),
                      isThreeLine: true,
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          _removeBankFromList(index);
                        },
                      ),
                    ),
                  );
                },
              ),
              fit: FlexFit.loose,
            ),

            const SizedBox(
              height: 20,
            ),

            //button begins
            ElevatedButton(onPressed: (){
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },  child: Text('Cooperatives'),

            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 50.0,
                    margin: EdgeInsets.all(10),
                    child: RaisedButton(
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => farmerslist
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUp2()));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      padding: const EdgeInsets.all(0.0),
                      child: Ink(
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Colors.white, Colors.white],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Container(
                          constraints: const BoxConstraints(
                              maxWidth: 150.0, minHeight: 50.0),
                          alignment: Alignment.center,
                          child: const Text(
                            "PREVIOUS",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50.0,
                    margin: EdgeInsets.all(10),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Dash()));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      padding: const EdgeInsets.all(0.0),
                      child: Ink(
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Colors.black, Colors.black],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Container(
                          constraints: const BoxConstraints(
                              maxWidth: 150.0, minHeight: 50.0),
                          alignment: Alignment.center,
                          child: const Text(
                            "SUBMIT",
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

            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                '           By clicking submit you agree,\nto the terms and conditions of this service.',
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton.extended(
                    label: const Text(''),
                    icon: const Icon(
                      Icons.account_balance_outlined,
                    ),
                    onPressed: () {
                      _addToListModal();
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    accountNumberController.dispose();
    accountNameController.dispose();
    super.dispose();
  }

  TextEditingController accountNumberController = TextEditingController();
  TextEditingController accountNameController = TextEditingController();

  _addToListModal() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
                //mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: [
                      const Text(
                        'Add Bank',
                        style: TextStyle(
                            fontSize: 16, letterSpacing: 1.0, color: Colors.blue),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.cancel_rounded), color: Colors.red,),
                    ],
                  ),

                  const Divider(),
                  const SizedBox(height: 10,),
                  DropdownButtonFormField(
                    hint: const Text(
                      'Select Bank',
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                    items: <String>[
                      'Access Bank',
                      'Citibank',
                      'Diamond Bank',
                      'Dynamic Standard Bank',
                      'Ecobank Nigeria',
                      'Fidelity Bank Nigeria',
                      'UBA',
                      'First Bank of Nigeria',
                      'First City Monument Bank',
                      'Guaranty Trust Bank',
                      'Heritage Bank Plc',
                      'Jaiz Bank',
                      'Keystone Bank Limited'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.account_balance_outlined),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      border: UnderlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 8),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) =>
                        value == null ? "Select A Bank" : null,
                    dropdownColor: Colors.white,
                    onChanged: (bankName) {
                      selectedBankName = bankName.toString();
                    },
                    value: selectedBankName,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: accountNumberController,
                    decoration:
                        const InputDecoration(hintText: "Account Number ....."),
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: accountNameController,
                    decoration: const InputDecoration(
                      hintText: "Account Name ..",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton.icon(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            _addToList();
                          },
                          label: const Text('Submit')),
                    ],
                  ),
                ]),
          );
        });
  }

  _addToList() {
    if (selectedBankName == null) {
      _showErrorMessage("Select Bank");
      return;
    }
    String accountNumber = accountNumberController.text.trim();
    String accountName = accountNameController.text.trim();
    if (accountNumber.isEmpty) {
      _showErrorMessage("Account number is required");
      return;
    }

    if (accountNumber.length != 10) {
      _showErrorMessage("Account number should be 11 digits");
      return;
    }

    if (accountName.isEmpty) {}

    Bank bank = Bank();
    bank.accountNumber = accountNumber;
    bank.accountName = accountName;
    bank.bankName = selectedBankName;

    _addBankToBankList(bank);
  }

  // _removeFromList(int position) {
  //   setState(() {
  //     list.removeAt(position);
  //   });
  // }

  _showErrorMessage(String? errorMessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Alert Dialog"),
            content: Text(errorMessage!),
          );
        });
  }

  _addBankToBankList(Bank bank) {
    setState(() {
      // add what was included in the text field
      bankList.add(bank);
    });
    Navigator.pop(context);
  }

  _removeBankFromList(int position) {
    setState(() {
      bankList.removeAt(position);
    });
  }

  _addToBankList() {
    return Column(
      children: [
        DropdownButtonFormField(
          hint: const Text(
            'Select Bank',
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
          items: <String>[
            'Access Bank',
            'Citibank',
            'Diamond Bank',
            ' Dynamic Standard Bank',
            'Ecobank Nigeria',
            'Fidelity Bank Nigeria',
            'First Bank of Nigeria',
            'First City Monument Bank',
            'Guaranty Trust Bank',
            'Heritage Bank Plc',
            'Jaiz Bank',
            'Keystone Bank Limited'
          ].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.account_balance_outlined),
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
          validator: (value) => value == null ? "Select A Crop" : null,
          dropdownColor: Colors.white,
          onChanged: (_) {},
          value: selectedBankName,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: const InputDecoration(
              fillColor: Colors.grey,
              focusColor: Colors.grey,
              labelText: "Account Number",
              labelStyle: TextStyle(
                  fontSize: 12,
                  letterSpacing: 1.1,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold),
            ),
            controller: accController,
            keyboardType: TextInputType.number,
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: const InputDecoration(
                fillColor: Colors.grey,
                focusColor: Colors.grey,
                labelText: "Account Name",
                labelStyle: TextStyle(
                    fontSize: 12,
                    letterSpacing: 1.1,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold)),
            controller: nameController,
          ),
        ),
      ],
    );
  }
}
