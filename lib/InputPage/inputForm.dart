import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wefly/InputPage/gMap.dart';
import 'package:wefly/BottomAppBar/bottom_app_bar.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;

class InputForm extends StatefulWidget {
  static String tag = 'Input-Page';

  final Widget child;

  InputForm({Key key, this.child}) : super(key: key);

  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  var _fromSlider = 1;
  var _toSlider = 1; // Initial Slider Value
  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              //alignment: Alignment.bottomCenter,
              //overflow: Overflow.visible,
              children: <Widget>[
                Container(
                  child: CustomGoogleMap(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      child: originLocation(
                          "From", FontAwesomeIcons.planeDeparture),
                    ),
                    Container(
                      child:
                          originLocation("To", FontAwesomeIcons.planeArrival),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      child: buildFromSlider(),
                    ),
                    Container(
                  child: buildToSlider(),
                ),
                  ],
                ),
                
                Container(
                  child: new Cal(),
                ),
                Container(
                  child: buildMaterialButton(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container buildFromSlider() {
    return Container(
      width: MediaQuery.of(context).size.width * .5,
      child: Card(
        elevation: 8,
        child: Slider(
          value: _fromSlider.toDouble(),
          min: 1.0,
          max: 50.0,
          divisions: 10,
          label: '$_fromSlider',//var _toSlider = 1;,
          onChanged: (double newValue) {
            setState(() {
              _fromSlider = newValue.round();
            });
          },
        ),
      ),
    );
  }
   Container buildToSlider() {
    return Container(
      width: MediaQuery.of(context).size.width * .5,
      child: Card(
        elevation: 8,
        child: Slider(
          value: _toSlider.toDouble(),
          min: 1.0,
          max: 50.0,
          divisions: 10,
          label: '$_toSlider',
          onChanged: (double newValue) {
            setState(() {
              _toSlider = newValue.round();
            });
          },
        ),
      ),
    );
  }

  MaterialButton buildMaterialButton(BuildContext context) {
    return MaterialButton(
        highlightColor: Colors.transparent,
        color: Colors.blue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        child: Text("Search",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25.0,
              fontFamily: "Nunito",
            )),
        onPressed: () {
          //Navigator.of(context).pushNamed(FloatActBttn.tag);
          Navigator.of(context).pushNamed(BttmAppBar.tag);
        });
  }

  Container originLocation(String text, dynamic fieldIcon) {
    return Container(
      width: MediaQuery.of(context).size.width * .5,
      child: Card(
        elevation: 8,
        child: Padding(
          padding: EdgeInsets.all(25.0),
          child: TextFormField(
            autofocus: false,
            //focusNode: myFocusNodeEmailLogin,
            //controller: loginEmailController,
            keyboardType: TextInputType.text,
            style: TextStyle(
                fontFamily: "Nunito", fontSize: 16.0, color: Colors.black),
            decoration: InputDecoration(
              border: InputBorder.none,
              icon: Icon(
                fieldIcon,
                color: Colors.black,
                size: 22.0,
              ),
              hintText: text,
              hintStyle: TextStyle(fontFamily: "Nunito", fontSize: 17.0),
            ),
          ),
        ),
      ),
    );
  }
}

class Cal extends StatelessWidget {
  const Cal({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        color: Colors.deepOrangeAccent,
        onPressed: () async {
          final List<DateTime> picked =
              await DateRagePicker.showDatePicker(
                  context: context,
                  initialFirstDate: new DateTime.now(),
                  initialLastDate: (new DateTime.now())
                      .add(new Duration(days: 7)),
                  firstDate: new DateTime(2015),
                  lastDate: new DateTime(2020));
          if (picked != null && picked.length == 2) {
            print(picked);
          }
        },
        child: new Text("Pick date range"));
  }
}

