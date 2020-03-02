import 'package:bloc/bloc.dart';
import 'package:coffee_shop/data/menu_repo.dart';
import 'package:coffee_shop/feature/menu/bloc/menu_event.dart';
import 'package:coffee_shop/feature/menu/bloc/menu_state.dart';
import 'package:dio/dio.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  @override
  MenuState get initialState => MenuInitial();

  MenuRepo repo = MenuRepo();

  @override
  Stream<MenuState> mapEventToState(MenuEvent event) async* {
    if (event is FetchAllMenu) {
      yield LoadingMenu();
      try {
        var response = await repo.getAllMenus();
        yield ResponseSuccess(response.data);
      } on DioError catch (e) {
        yield ResponseFailed(e.message);
      }
    }
  }
}
