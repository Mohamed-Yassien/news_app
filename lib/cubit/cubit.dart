import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/modules/business_screen.dart';
import 'package:news_app/modules/science_screen.dart';
import 'package:news_app/modules/sports_screen.dart';
import 'package:news_app/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = const [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  List<BottomNavigationBarItem> navBarItems = const [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.add_business,
      ),
      label: 'business',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports_baseball,
      ),
      label: 'sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science_outlined,
      ),
      label: 'science',
    ),
  ];

  void changeBottomBarState(int index) {
    currentIndex = index;
    if (index == 1) {
      getSportsData();
    }
    if (index == 2) {
      getScienceData();
    }
    emit(NewsBottomBarState());
  }

  List<dynamic> businessData = [];

  void getBusinessData() {
    DioHelper.getData(path: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '7f169cdbd868463c83dfc4e22ea2aa93',
    }).then((value) {
      businessData = value.data['articles'];
      emit(NewsGetBusinessDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessDataErrorState(error));
    });
  }

  List<dynamic> sportsData = [];

  void getSportsData() {
    DioHelper.getData(path: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': '7f169cdbd868463c83dfc4e22ea2aa93',
    }).then((value) {
      sportsData = value.data['articles'];
      emit(NewsGetSportsDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSportsDataErrorState(error));
    });
  }

  List<dynamic> scienceData = [];

  void getScienceData() {
    DioHelper.getData(path: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      'apiKey': '7f169cdbd868463c83dfc4e22ea2aa93',
    }).then((value) {
      scienceData = value.data['articles'];
      emit(NewsGetScienceDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetScienceDataErrorState(error));
    });
  }



  List<dynamic> searchData = [];

  void getSearchData(String value) {
    DioHelper.getData(path: 'v2/everything', query: {
      'q': value,
      'apiKey': '7f169cdbd868463c83dfc4e22ea2aa93',
    }).then((value) {
      searchData = value.data['articles'];
      emit(NewsSearchDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsSearchDataErrorState(error));
    });
  }
}
