import 'package:coffee_shop/model/coffee_mdl.dart';

abstract class MenuState {}

class MenuInitial extends MenuState {
  MenuInitial();
}

class LoadingMenu extends MenuState {
  LoadingMenu();
}
class ResponseFailed extends MenuState {
  final String errorMessage;

  ResponseFailed(this.errorMessage);
}

class ResponseSuccess extends MenuState {
  final List<MenuItemMdl> listDataMenu;

  ResponseSuccess(this.listDataMenu);
}
