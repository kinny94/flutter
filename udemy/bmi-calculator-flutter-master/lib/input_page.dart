import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/icon_content.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender {
  male,
  female 
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height = 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
        Expanded(child: 
          Row(children: <Widget>[
            Expanded(
              child: ReusableCard(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.male; 
                  });
                },
                color: selectedGender == Gender.male ? kActiveCardColor : kInactiveCardColor,
                cardChild: IconContent(icon: FontAwesomeIcons.mars, label: 'MALE',),
              ),
            ),
            Expanded(
              child: ReusableCard(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                color: selectedGender == Gender.female ? kActiveCardColor : kInactiveCardColor,
                cardChild: IconContent(icon: FontAwesomeIcons.venus, label: 'FEMALE',),
              ),
            ),
          ]),
        ),
        Expanded(
          child: ReusableCard(
            color: kActiveCardColor,
            cardChild: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Text('HEIGHT', style: kLabelTextStyle,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, 
                crossAxisAlignment: CrossAxisAlignment.baseline, 
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Text(
                    height.toString(),
                    style: kNumberStyle
                  ),
                  Text(
                    'cm',
                    style: kNumberStyle,
                  ),
                ]
              ),
              Slider(
                value: height.toDouble(),
                min: 120.0,
                max: 220.0,
                activeColor: Color(0xFFEB1555),
                inactiveColor: Color(0xFF8D8E98),
                onChanged: (double newValue) {
                  setState(() {
                    height = newValue.round(); 
                  });
                },
              )
            ]),
          ),
          
        ),
        Expanded(child: 
          Row(children: <Widget>[
            Expanded(
              child:ReusableCard(color: kActiveCardColor),
            ),
            Expanded(
              child: ReusableCard(color: kActiveCardColor),
            ), 
          ]),        
        ),
         Container(
          color: kBottomContainerColor,
          margin: EdgeInsets.only(top: 10.0),
          width: double.infinity,
          height: kBottomContainerHeight,
        )],
      ),
    );
  }
}

