import 'package:dazllapp/config/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class myproject extends StatefulWidget {
  myproject({Key? key}) : super(key: key);

  @override
  State<myproject> createState() => _myprojectState();
}

class _myprojectState extends State<myproject> {
  @override
  void initState() {
    load();
    super.initState();
  }

  load() async {
    await context.read(roomsprovider).myproject();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
