import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/mode_cubit/mode_cubit.dart';
import 'package:news_app/cubit/states.dart';

import '../modules/search_screen.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'News App',
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchScreen(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.search,
                ),
              ),
              IconButton(
                onPressed: () {
                  ModeCubit.get(context).changeMode();
                },
                icon: const Icon(
                  Icons.brightness_4,
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.navBarItems,
            onTap: (index) {
              cubit.changeBottomBarState(index);
            },
            currentIndex: cubit.currentIndex,
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
