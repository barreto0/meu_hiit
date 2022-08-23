import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_hiit/app/modules/home/home_store.dart';

import 'home_page.dart';

abstract class HomePageViewModel extends State<HomePage> {
  HomeStore homeStore = Modular.get<HomeStore>();
}
