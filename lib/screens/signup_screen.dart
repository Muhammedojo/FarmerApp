import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'home_screen.dart';
import 'signup2_screen.dart';
import 'dashboard_screen.dart';
import 'cooperative_list_screen.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {


  @override
  late DateTime date;

  String getText() {
    // ignore: unnecessary_null_comparison
    if (date == null) {
      return 'Select Date';
    } else {
      return '${date.month}-${date.day}-${date.year}';
    }
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(DateTime.now().year - 60),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (newDate == null) {
      return setState(() {
        date = newDate!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Personal Information',
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
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => Home()));
          },
          color: Colors.white,
        ),
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              '1/3',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          )
        ],
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 50, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Sign Up",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 33,
                        letterSpacing: 2.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField(
                hint: const Text(
                  'Title',
                  style: TextStyle(
                      fontSize: 12.0,
                      letterSpacing: 1.1,
                      fontWeight: FontWeight.bold),
                ),
                items: <String>[
                  'Mr',
                  'Mrs',
                  'Miss',
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  focusColor: Colors.grey,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey, width: 8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                ),
                validator: (value) => value == null ? "Select a Title" : null,
                dropdownColor: Colors.white,
                onChanged: (_) {},
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                child: Row(
                  children: [
                    Container(
                      width: 200,
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            fillColor: Colors.grey,
                            focusColor: Colors.grey,
                            labelText: "FirstName",
                            labelStyle: TextStyle(
                                fontSize: 12,
                                letterSpacing: 1.1,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold)),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Container(
                      width: 200,
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            fillColor: Colors.grey,
                            focusColor: Colors.grey,
                            labelText: "LastName",
                            labelStyle: TextStyle(
                                fontSize: 12,
                                letterSpacing: 1.1,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold)),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              DropdownButtonFormField(
                hint: const Text(
                  'Gender',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.1,
                  ),
                ),
                items: <String>[
                  'Male',
                  'Female',
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
                validator: (value) => value == null ? "Select a Gender" : null,
                dropdownColor: Colors.white,
                onChanged: (_) {},
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField(
                hint: const Text(
                  'State Of Origin',
                  style: TextStyle(
                      fontSize: 12.0,
                      letterSpacing: 1.1,
                      fontWeight: FontWeight.bold),
                ),
                items: <String>[
                  "Abia",
                  "Adamawa",
                  "Akwa Ibom",
                  "Anambra",
                  "Bauchi",
                  "Bayelsa",
                  "Benue",
                  "Borno",
                  "Cross River",
                  "Delta",
                  "Ebonyi",
                  "Edo",
                  "Ekiti",
                  "Enugu",
                  "FCT - Abuja",
                  "Gombe",
                  "Imo",
                  "Jigawa",
                  "Kaduna",
                  "Kano",
                  "Katsina",
                  "Kebbi",
                  "Kogi",
                  "Kwara",
                  "Lagos",
                  "Nasarawa",
                  "Niger",
                  "Ogun",
                  "Ondo",
                  "Osun",
                  "Oyo",
                  "Plateau",
                  "Rivers",
                  "Sokoto",
                  "Taraba",
                  "Yobe",
                  "Zamfara"
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
                height: 10,
              ),
              DropdownButtonFormField(
                hint: const Text(
                  'LGA of Origin',
                  style: TextStyle(
                      fontSize: 12.0,
                      letterSpacing: 1.1,
                      fontWeight: FontWeight.bold),
                ),
                items: <String>[
                  "Aba North",
                  "Aba South",
                  "Arochukwu",
                  "Bende",
                  "Ikawuno",
                  "Ikwuano",
                  "Isiala-Ngwa North",
                  "Isiala-Ngwa South",
                  "Isuikwuato",
                  "Umu Nneochi",
                  "Obi Ngwa",
                  "Obioma Ngwa",
                  "Ohafia",
                  "Ohaozara",
                  "Osisioma",
                  "Ugwunagbo",
                  "Ukwa West",
                  "Ukwa East",
                  "Umuahia North",
                  "Umuahia South",
                  "Demsa",
                  "Fufore",
                  "Ganye",
                  "Girei",
                  "Gombi",
                  "Guyuk",
                  "Hong",
                  "Jada",
                  "Lamurde",
                  "Madagali",
                  "Maiha",
                  "Mayo-Belwa",
                  "Michika",
                  "Mubi-North",
                  "Mubi-South",
                  "Numan",
                  "Shelleng",
                  "Song",
                  "Toungo",
                  "Yola North",
                  "Yola South",
                  "Abak",
                  "Eastern-Obolo",
                  "Eket",
                  "Esit-Eket",
                  "Essien-Udim",
                  "Etim-Ekpo",
                  "Etinan",
                  "Ibeno",
                  "Ibesikpo-Asutan",
                  "Ibiono-Ibom",
                  "Ika",
                  "Ikono",
                  "Ikot-Abasi",
                  "Ikot-Ekpene",
                  "Ini",
                  "Itu",
                  "Mbo",
                  "Mkpat-Enin",
                  "Nsit-Atai",
                  "Nsit-Ibom",
                  "Nsit-Ubium",
                  "Obot-Akara",
                  "Okobo",
                  "Onna",
                  "Oron",
                  "Oruk Anam",
                  "Udung-Uko",
                  "Ukanafun",
                  "Urue-Offong/Oruko",
                  "Uruan",
                  "Uyo",
                  "Aguata",
                  "Anambra East",
                  "Anambra West",
                  "Anaocha",
                  "Awka North",
                  "Awka South",
                  "Ayamelum",
                  "Dunukofia",
                  "Ekwusigo",
                  "Idemili-North",
                  "Idemili-South",
                  "Ihiala",
                  "Njikoka",
                  "Nnewi-North",
                  "Nnewi-South",
                  "Ogbaru",
                  "Onitsha-North",
                  "Onitsha-South",
                  "Orumba-North",
                  "Orumba-South",
                  "Alkaleri",
                  "Bauchi",
                  "Bogoro",
                  "Damban",
                  "Darazo",
                  "Dass",
                  "Gamawa",
                  "Ganjuwa",
                  "Giade",
                  "ItasGadau",
                  "Jama'Are",
                  "Katagum",
                  "Kirfi",
                  "Misau",
                  "Ningi",
                  "Shira",
                  "Tafawa-Balewa",
                  "Toro",
                  "Warji",
                  "Zaki",
                  "Ado",
                  "Agatu",
                  "Apa",
                  "Buruku",
                  "Gboko",
                  "Guma",
                  "Gwer-East",
                  "Gwer-West",
                  "Katsina-Ala",
                  "Konshisha",
                  "Kwande",
                  "Logo",
                  "Makurdi",
                  "Ogbadibo",
                  "Ohimini",
                  "Oju",
                  "Okpokwu",
                  "Otukpo",
                  "Tarka",
                  "Ukum",
                  "Ushongo",
                  "Vandeikya",
                  "Abadam",
                  "Askira-Uba",
                  "Bama",
                  "Bayo",
                  "Biu",
                  "Chibok",
                  "Damboa",
                  "Dikwa",
                  "Gubio",
                  "Guzamala",
                  "Gwoza",
                  "Hawul",
                  "Jere",
                  "Kaga",
                  "Kala\/Balge",
                  "Konduga",
                  "Kukawa",
                  "Kwaya-Kusar",
                  "Mafa",
                  "Magumeri",
                  "Maiduguri",
                  "Marte",
                  "Mobbar",
                  "Monguno",
                  "Ngala",
                  "Nganzai",
                  "Shani"
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
                validator: (value) => value == null ? "Select a Gender" : null,
                dropdownColor: Colors.white,
                onChanged: (_) {},
              ),
              const SizedBox(
                height: 10,
              ),
              // Row(children: const []),
              DropdownButtonFormField(
                hint: const Text(
                  'State Of Residence',
                  style: TextStyle(
                      fontSize: 12.0,
                      letterSpacing: 1.1,
                      fontWeight: FontWeight.bold),
                ),
                items: <String>[
                  "Abia",
                  "Adamawa",
                  "Akwa Ibom",
                  "Anambra",
                  "Bauchi",
                  "Bayelsa",
                  "Benue",
                  "Borno",
                  "Cross River",
                  "Delta",
                  "Ebonyi",
                  "Edo",
                  "Ekiti",
                  "Enugu",
                  "FCT - Abuja",
                  "Gombe",
                  "Imo",
                  "Jigawa",
                  "Kaduna",
                  "Kano",
                  "Katsina",
                  "Kebbi",
                  "Kogi",
                  "Kwara",
                  "Lagos",
                  "Nasarawa",
                  "Niger",
                  "Ogun",
                  "Ondo",
                  "Osun",
                  "Oyo",
                  "Plateau",
                  "Rivers",
                  "Sokoto",
                  "Taraba",
                  "Yobe",
                  "Zamfara"
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
                height: 10,
              ),
              DropdownButtonFormField(
                hint: const Text(
                  'Passport Type',
                  style: TextStyle(
                      fontSize: 12.0,
                      letterSpacing: 1.1,
                      fontWeight: FontWeight.bold),
                ),
                items: <String>[
                  'International Passport',
                  'Voters Card',
                  'Cooperative ID card',
                  'University ID card',
                  "Driver's License",
                  'National ID Card',
                  'Others',
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
                validator: (value) => value == null ? "Select a Gender" : null,
                dropdownColor: Colors.white,
                onChanged: (_) {},
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.phone_iphone_outlined),
                      fillColor: Colors.grey,
                      focusColor: Colors.grey,
                      labelText: "Phone",
                      labelStyle: TextStyle(
                          fontSize: 12,
                          letterSpacing: 1.1,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold)),
                  keyboardType: TextInputType.phone,
                  maxLength: 11,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.date_range),
                      fillColor: Colors.grey,
                      focusColor: Colors.grey,
                      labelText: "Date of Birth",
                      labelStyle: TextStyle(
                          fontSize: 12,
                          letterSpacing: 1.1,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold)),
                  keyboardType: TextInputType.number,
                  onTap: (){
                    pickDate(context);
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.location_city),
                      fillColor: Colors.grey,
                      focusColor: Colors.grey,
                      labelText: "House Address",
                      labelStyle: TextStyle(
                          fontSize: 12,
                          letterSpacing: 1.1,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold)),
                  keyboardType: TextInputType.streetAddress,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                      fillColor: Colors.grey,
                      focusColor: Colors.grey,
                      labelText: "Village",
                      labelStyle: TextStyle(
                          fontSize: 12,
                          letterSpacing: 1.1,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold)),
                  keyboardType: TextInputType.text,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              DropdownButtonFormField(
                hint: const Text(
                  'Marital Status',
                  style: TextStyle(
                      fontSize: 12.0,
                      letterSpacing: 1.1,
                      fontWeight: FontWeight.bold),
                ),
                items: <String>[
                  'Single',
                  'Married',
                  'Divorced',
                  'Widow',
                  'Widower',
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
              const SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    fillColor: Colors.grey,
                    focusColor: Colors.grey,
                    labelText: "Passport Number",
                    labelStyle: TextStyle(
                        fontSize: 12,
                        letterSpacing: 1.1,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                      fillColor: Colors.grey,
                      focusColor: Colors.grey,
                      labelText: "Next of Kin",
                      labelStyle: TextStyle(
                          fontSize: 12,
                          letterSpacing: 1.1,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold)),
                  keyboardType: TextInputType.text,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.phone_iphone_outlined),
                      fillColor: Colors.grey,
                      focusColor: Colors.grey,
                      labelText: "Phone",
                      labelStyle: TextStyle(
                          fontSize: 12,
                          letterSpacing: 1.1,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold)),
                  keyboardType: TextInputType.phone,
                ),
              ),
              const SizedBox(height: 30.0),
              Container(
                height: 50.0,
                margin: const EdgeInsets.all(10),
                child: RaisedButton(
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
                        // gradient: LinearGradient(
                        //   colors: [Color(0xFFD71E0E), Color(0xFFD71E0E),],
                        //   begin: Alignment.centerLeft,
                        //   end: Alignment.centerRight,
                        // ),
                        color: Colors.blueGrey[900],
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Container(
                      constraints: const BoxConstraints(
                          maxWidth: 250.0, minHeight: 50.0),
                      alignment: Alignment.center,
                      child: const Text(
                        "NEXT",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          letterSpacing: 1.1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
