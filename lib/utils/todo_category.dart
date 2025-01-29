import 'package:flutter/material.dart';

// enum을 사용해 todo 카테고리 정의.
enum TodoCategory {
  education(Icons.school, Colors.blueGrey),
  health(Icons.favorite, Colors.orange),
  home(Icons.home, Colors.green),
  others(Icons.calendar_month, Colors.purple),
  personal(Icons.person, Colors.lightBlue),
  shopping(Icons.shopping_cart, Colors.pink),
  social(Icons.people, Colors.brown),
  travel(Icons.flight, Colors.deepOrange),
  work(Icons.work, Colors.amber);

  static TodoCategory stringToCategory(String name) {
    try {
      return TodoCategory.values
          .firstWhere((category) => category.name == name);
    } catch (e) {
      return TodoCategory.others;
    }
  }

  final IconData icon;
  final Color color;
  const TodoCategory(this.icon, this.color);
}
