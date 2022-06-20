abstract class NewsStates{}

class NewsInitialState extends NewsStates{}

class NewsBottomBarState extends NewsStates{}

class NewsGetBusinessDataSuccessState extends NewsStates{}

class NewsGetBusinessDataErrorState extends NewsStates{
  final String error;

  NewsGetBusinessDataErrorState(this.error);
}

class NewsGetSportsDataSuccessState extends NewsStates{}

class NewsGetSportsDataErrorState extends NewsStates{
  final String error;

  NewsGetSportsDataErrorState(this.error);
}

class NewsGetScienceDataSuccessState extends NewsStates{}

class NewsGetScienceDataErrorState extends NewsStates{
  final String error;

  NewsGetScienceDataErrorState(this.error);
}

class NewsSearchDataSuccessState extends NewsStates{}

class NewsSearchDataErrorState extends NewsStates{
  final String error;

  NewsSearchDataErrorState(this.error);
}