import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/utils/blocs/app/cubit.dart';
import 'package:weather_app/core/utils/blocs/app/states.dart';
import 'package:weather_app/features/home/presentation/widgets/new_design_widgets/search_widget.dart';

class SearchHome extends StatelessWidget {
  const SearchHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        AppBloc cubit = AppBloc.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0,),
                      ),
                      labelText: 'Search for the city',
                    ),
                    controller: cubit.searchController,
                    onFieldSubmitted: (value){
                      cubit.getSearchResult(value);
                      debugPrint(value.toString());
                    },
                  ),
                  const SearchWidget(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
