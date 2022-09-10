import 'package:flutter/material.dart';
import 'package:weather_app/features/home/presentation/widgets/new_design_widgets/manage_location_widget.dart';

class ManageLocationsHome extends StatelessWidget {
  const ManageLocationsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: const ManageLocationWidget(),
    );
  }
}
