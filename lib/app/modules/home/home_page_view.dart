import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'home_page_view_model.dart';

class HomePageView extends HomePageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Observer(
        builder: (context) => Text('${homeStore.counter}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          homeStore.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
