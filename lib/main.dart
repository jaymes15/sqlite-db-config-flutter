import 'package:crud/databsehelper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData.dark(),
      title:"DataBase",
      home:HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 final dbhelper = DatabaseHelper.instance;
 String id = "hey";
 void insertdata() async{
   Map<String, dynamic> row ={
     DatabaseHelper.columnName:"James",
     DatabaseHelper.columnAge: 22,
   };
   final id = await dbhelper.insert(row);
   setState(() {
     this.id = id.toString();
   });
 }
 void queryall() async{
   var allrows = await dbhelper.queryallrows();
   allrows.forEach((rowval){
     setState(() {
       this.id = rowval.toString();
     });
   });
 }

 void queryspecific() async{
   var allrows = await dbhelper.queryspecific(18);
   allrows.forEach((rowval){
     setState(() {
       this.id = rowval.toString();
     });
   });
 }

 void deletedata() async{
   var row = await dbhelper.deletedata(1);
   print(row);

   });
 }

void updatedata() async{
  var row = await dbhelper.updatedata(3);
  print(row);

});
}
  @override
  Widget build(BuildContext context) {


    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 0.0,
        ),
          ),
        Text(id),
        RaisedButton(
          onPressed: insertdata,
          padding: EdgeInsets.symmetric(
          horizontal: 40.0,
          vertical: 20.0,
          ),
          color: Colors.blue,
          child: Text(
          "Insert",
          style:TextStyle(
            fontSize: 18.0,
            fontFamily: "Verdana",
          ),
          ),
        ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 0.0,
              ),
            ),
            RaisedButton(
              onPressed: queryall,
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 20.0,
              ),
              color: Colors.red,
              child: Text(
                "Query",
                style:TextStyle(
                  fontSize: 18.0,
                  fontFamily: "Verdana",
                ),
              ),
            ),
            RaisedButton(
              onPressed: queryspecific,
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 20.0,
              ),
              color: Colors.red,
              child: Text(
                "Query Specific",
                style:TextStyle(
                  fontSize: 18.0,
                  fontFamily: "Verdana",
                ),
              ),
            ),
            RaisedButton(
              onPressed: deletedata,
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 20.0,
              ),
              color: Colors.red,
              child: Text(
                "Delete",
                style:TextStyle(
                  fontSize: 18.0,
                  fontFamily: "Verdana",
                ),
              ),
            ),
            RaisedButton(
              onPressed: updatedata,
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 20.0,
              ),
              color: Colors.red,
              child: Text(
                "Delete",
                style:TextStyle(
                  fontSize: 18.0,
                  fontFamily: "Verdana",
                ),
              ),
            ),
    ],
        ),
    );
  }
}

