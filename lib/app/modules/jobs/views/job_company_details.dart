import 'package:flutter/material.dart';

class JobCompanyDetails extends StatefulWidget {
  const JobCompanyDetails({super.key});

  @override
  State<JobCompanyDetails> createState() => _JobCompanyDetailsState();
}

class _JobCompanyDetailsState extends State<JobCompanyDetails> {
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height * 1;
    double screenwidth = MediaQuery.of(context).size.width * 1;

    return const SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFF0F0F0),
      ),
    );
  }
}
