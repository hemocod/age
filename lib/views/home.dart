// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, unnecessary_string_interpolations

// ignore: unused_import
import 'package:age/constant/color.dart';
import 'package:age/global/helper_function.dart';
import 'package:age/global/utils.dart';
import 'package:age/views/result.dart';
import 'package:age/widget/app_name.dart';
import 'package:age/widget/custom_bottom_paint.dart';
import 'package:age/widget/custom_large_botton.dart';
import 'package:age/widget/custom_top_paint_botton.dart';
import 'package:age/widget/date_picker_field.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      
      body: Container(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(width, (350 * 0.31473214285714285).toDouble()), 
                    painter: CustomTopPaint(),
                  ),
                  const Positioned(
                    top: 30,
                    child: AppName()
                  )
                ],
              ),
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration
              (
                color: Color( 0xff9C254D),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              
              
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text( 
                '  تذكر ان العمر مجرد رقم ولا يقاس الا بالاوقات الجميلة   ',
                style: TextStyle(
                  fontSize: 18, 
                  height: 1.5,
                  fontWeight: FontWeight.w400, 
                  fontFamily: 'roboto', 
                  color: Color( 0xffEFF5F5) ,
                ),
              ),
            ),
            Spacer(),
            Container(
              
              child:Lottie.network('https://assets8.lottiefiles.com/packages/lf20_szhkp6zk.json'),
              
            ),
            Spacer(),
            DatePickerField(
              level: 'Select date of birth',
              onTap: ()=> _selectDate(context, selectedBithDate, "BirthDate" ),
              hintText: "${getFormatedDate(selectedBithDate)}",
            ),
            SizedBox(height: 10,),
            DatePickerField(
              level: 'Select today\'s date',
              onTap: ()=> _selectDate(context, selectedCurrentDate, "CurrentDate"),
              hintText: "${getFormatedDate(selectedCurrentDate)}",
            ),
            Container(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 80),
                    child: CustomPaint(
                      size: Size(width, (399 * 0.31473214285714285).toDouble()), 
                      painter: CustomBottomPaint(),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    child: CustomLargeButton(
                      buttonLevel: "Calculate",
                      onPressed: (){
                        Route route = MaterialPageRoute(builder: (context)=>ResultPage());
                        Navigator.push(context, route);
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  //This function used for open date picker 
  Future<void> _selectDate(BuildContext context, DateTime initialDate, String from) async {
    if(from == 'BirthDate') {
       final DateTime? pickedBirthDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2101),
      );
      if (pickedBirthDate != null && pickedBirthDate != selectedBithDate) {
        setState(() {
        selectedBithDate = pickedBirthDate;
      });
      }
    } 
    if(from == "CurrentDate"){
      final DateTime? pickedCurrentDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2101),
      );

      if (pickedCurrentDate != null && pickedCurrentDate != selectedCurrentDate) {
        setState(() {
        selectedCurrentDate = pickedCurrentDate;
      });
      }
    }

  }
}
