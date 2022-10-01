import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_admin_dashboard/constants/constants.dart';
import 'package:responsive_admin_dashboard/controllers/controller.dart';
import 'package:responsive_admin_dashboard/models/customer-model.dart';

import '../../controllers/service.dart';
import '../../widgets/dialog-add-new-customer.dart';

class CustomerUI extends StatefulWidget {
  CustomerUI({Key? key}) : super(key: key);

  @override
  State<CustomerUI> createState() => _CustomerUIState();
}

class _CustomerUIState extends State<CustomerUI> {

  Future<List<CustomerModel>>? employeeList;
  List<CustomerModel>? retrievedEmployeeList;



  @override
  void initState() {

    super.initState();
  }

  Future<void> _initRetrieval() async {
    employeeList = ServiceAPI.retrieveEmployees();
    retrievedEmployeeList = await ServiceAPI.retrieveEmployees();
    print(employeeList.toString());

  }

  @override
  Widget build(BuildContext context) {


    print('BUILD');
    _initRetrieval();
    return Container(
      height: 400,
      width: double.infinity,
      padding: EdgeInsets.all(appPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Customer List",
                textScaleFactor: 2,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Spacer(),
              OutlinedButton(
                onPressed: () {
                  ShowDialogAddCustomer.showInformationDialog(context);
                },
                child: Text('Add New Customer'),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Column(

              children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                Text(
                  "Name",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(width: 250,),
                Text(
                  "Address",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(width: 250,),
                Text(
                  "Contact",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(width: 250,),
                Text(
                  "Action",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 200,


    child: FutureBuilder(
    future: employeeList,
    builder:
    (BuildContext context, AsyncSnapshot<List<CustomerModel>> snapshot) {
    if (snapshot.hasData && snapshot.data!.isNotEmpty) {

      return ListView.separated(
          itemCount: retrievedEmployeeList!.length,
          separatorBuilder: (context, index) => const SizedBox(
            height: 10,
          ),
          itemBuilder: (context, index) {
            return Text(retrievedEmployeeList![index].firstName.toString());
          });
    } else if (snapshot.connectionState == ConnectionState.done &&
        retrievedEmployeeList!.isEmpty) {
      return Center(
        child: ListView(
          children: const <Widget>[
            Align(alignment: AlignmentDirectional.center,
                child: Text('No data available')),
          ],
        ),
      );
    }else {
      return const Center(child: CircularProgressIndicator());
    }}),



            ),
          ])
        ],
      ),
    );
  }


}
