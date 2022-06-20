import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/shared/widgets/news_builder.dart';
import 'package:news_app/shared/widgets/reusable_text_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ReusableTextField(
              controller: searchController,
              prefixIcon: Icons.search,
              textLabel: 'search',
              validate: (String value) {
                if (value.isEmpty) {
                  return 'search must not be empty';
                }
              },
              onChange: (String value) {
                NewsCubit.get(context).getSearchData(value);
              },
            ),
          ),
          Expanded(
            child: BlocConsumer<NewsCubit, NewsStates>(
              listener: (context, state) {},
              builder: (context, state) {
                var list = NewsCubit.get(context).searchData;
                return newsBuilder(
                  list,
                  isSearch: true,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
