import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/mode_cubit/mode_states.dart';
import 'package:news_app/network/local/cache_helper.dart';

class ModeCubit extends Cubit<ModeStates> {
  ModeCubit() : super(ModeInitialState());

  static ModeCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeMode({bool? modeFromShared}) {
    if (modeFromShared != null) {
      isDark = modeFromShared;
      emit(ModeChangeState());
    } else {
      isDark = !isDark;
      CacheHelper.setModeBoolean(
        key: 'isDark',
        value: isDark,
      ).then(
        (value) => emit(
          ModeChangeState(),
        ),
      );
    }
  }
}
