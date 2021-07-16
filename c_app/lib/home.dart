import 'package:c_app/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:c_app/hexcolor.dart';
class BillSplitter extends StatefulWidget {
  const BillSplitter({ Key? key }) : super(key: key);

  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;
  Color _purple = HexColor("#6908d6");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50 ],
      body:Container( 
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1),
        alignment:Alignment.center,
        color: Colors.blue[50],
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.5),
          children:<Widget> [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(12.0)

              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Total per Person',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    Text('\$ ${calculateTotalPerPerson(_billAmount,_personCounter,_tipPercentage)}',
                    style: TextStyle(fontSize: 34.9),)
                  ],

                ),
              ),
            
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.grey,
                  style: BorderStyle.solid
                )
              ),
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType:TextInputType.numberWithOptions(decimal: true) ,
                    style: TextStyle(color: Colors.grey),
                    decoration: InputDecoration(
                      prefixText: "Bill Amount",
                      prefixIcon: Icon(Icons.money_sharp) ,
                    ),
                    onChanged: (String value ){
                      try {
                        _billAmount = double.parse(value);
                      } catch (exception) {
                        _billAmount = 0.0;
                      }
                    },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:<Widget> [
                        Text('Split',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold,
                          wordSpacing: 10

                          ),
                          ),
                           Row(children: [

                             InkWell(
                               onTap: (){
                                 setState(() {
                                   if (_personCounter > 1) {
                                     _personCounter -- ;
                                     
                                   }
                                   else{

                                   }
                                 });
                               },
                               child: Container(
                                 width: 40,
                                 height: 40,
                                 margin: EdgeInsets.all(10.0),
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(7.0),
                                   color: Colors.blue[100]
                                 ),
                                 child: Center(
                                   child: Text("-",
                                   style: TextStyle(
                                     color: Colors.blue,
                                     
                                     fontSize: 30
                                   ),),
                                 ),
                               ),
                               
                             ),
                             Text("$_personCounter"),
                             InkWell(
                               onTap: (){
                                 setState(() {
                                   
                                     _personCounter ++ ;
                        
                                 });
                               },
                               child: Container(
                                 width: 40,
                                 height: 40,
                                 margin: EdgeInsets.all(10.0),
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(7.0),
                                   color: Colors.blue[100]
                                 ),
                                 child: Center(
                                   child: Text("+",
                                   style: TextStyle(
                                     color: Colors.blue,
                                     
                                     fontSize: 20
                                   ),),
                                 ),
                               ),
                               
                             ),
                             

                        
                      ],
                      )
                      ],
                     
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Text("Tip",
                          style: TextStyle(
                          fontWeight: FontWeight.bold),),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 50, 0),
                          child: Text("${calculateTotalTip(_billAmount,_personCounter,_tipPercentage)}"),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text("$_tipPercentage%",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                        ),),
                        Slider(min:0,max:100,value:_tipPercentage.toDouble(),
                        divisions: 10 , onChanged: (double value){
                          setState(() {
                            _tipPercentage = value.round();
                          });
                        })
                      ],
                    )
                    
                  
               ],

            ),)
          ]
        ),
      ),
        );
      
        
  }
  calculateTotalPerPerson( double billAmount, int splitBy, int tipPercentage){
    var totalPerPerson = (calculateTotalTip(billAmount, splitBy, tipPercentage))+_billAmount/splitBy;
    return totalPerPerson;
  }
  calculateTotalTip(double billAmt,int splitBy, int tipPercentage){
    double totalTip = 0.0;
    
    if(billAmt< 0 ||billAmt.toString().isEmpty || billAmt == null){

    }else {
      totalTip= (billAmt*tipPercentage)/100;
    }
    return totalTip;
  }
}