import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:space_x/features/feature_company/domain/entities/response/company_data_entity.dart';
import 'package:space_x/features/feature_company/presentation/widgets/company_about_details_widget.dart';

class CompanyBodyWidget extends StatelessWidget {
  final CompanyDataModelEntity company;

  CompanyBodyWidget({required this.company});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.asset("assets/images/space_x_2.png"),
              SizedBox(height: 20.0),
              Text(
                company.summary.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 30.0),
              Divider(color: Colors.white),
              SizedBox(height: 30.0),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  //width: 120.0,
                  child: Row(
                    children: [
                      Icon(
                        Icons.build,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        "About Company",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              CustomRowWidget(
                  title: "Name",
                  company: company.name.toString()),
              CustomRowWidget(
                  title: "Founder",
                  company: company.founder.toString()),
              CustomRowWidget(
                  title: "Founded",
                  company: company.founded.toString()),
              CustomRowWidget(
                  title: "Employees",
                  company: company.employees.toString()),
              CustomRowWidget(
                  title: "Vehicles",
                  company: company.vehicles.toString()),
              CustomRowWidget(
                  title: "Launch Sites",
                  company: company.launchSites.toString()),
              CustomRowWidget(
                  title: "Test Sites",
                  company: company.testSites.toString()),
              CustomRowWidget(
                  title: "CEO", company: company.ceo.toString()),
              CustomRowWidget(title: "CTO",
                  company: company.cto.toString()),
              CustomRowWidget(
                  title: "COO",
                  company: company.coo.toString()),
              CustomRowWidget(
                  title: "CTO Propulsion",
                  company: company.ctoPropulsion.toString()),
              CustomRowWidget(
                  title: "Valuation",
                  company: company.valuation.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
