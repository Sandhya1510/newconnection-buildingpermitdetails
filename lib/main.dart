import 'package:flutter/material.dart';
import 'package:newconnection_buildingpemitdetails/responsive_row_column.dart';

void main() {
  runApp(
    MaterialApp(
      home: BuildingPermitDetailsPage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class BuildingPermitDetailsPage extends StatelessWidget {
  const BuildingPermitDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(
            title: Text("New Connection Form"),
            backgroundColor: Colors.blueGrey,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Customer Name
                  ResponsiveRowColumn(
                    spacing: 10,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Building Permit Number *"),
                          SizedBox(
                            width: 450,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Enter Permit Name',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(height: 1),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Building Area *"),
                          SizedBox(
                            width: 450,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Enter Building Area',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16,),
                  ResponsiveRowColumn(
                    spacing: 10,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Customer Class *"),
                          SizedBox(
                            width: 450,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Select Customer Class',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(height: 1),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Premise Type *"),
                          SizedBox(
                            width: 450,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Select Premise Type',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16,),
                  ResponsiveRowColumn(
                    spacing: 10,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Service Type"),
                          SizedBox(
                            width: 450,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Select Service Type',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(height: 1),
                      // Container()
                      // SizedBox(width: 250), // fixed Expanded issue
                    ],
                  ),

                  SizedBox(height: 32),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 110,
                          height: 38,
                          child: ElevatedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Back pressed')),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: BorderSide(color: Colors.redAccent, width: 1), // 🔴 red border
                            ),
                            child: Text(
                              'Back',
                              style: TextStyle(color: Colors.redAccent),
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        SizedBox(
                          width: 110,
                          height: 38,
                          child: ElevatedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Continue pressed')),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                            ),
                            child: Text(
                              'Continue',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )

                ],
              ),
            ),
          ),
          backgroundColor: Colors.grey.shade100,
        );
      },
    );
  }
}
